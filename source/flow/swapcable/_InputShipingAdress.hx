package flow.swapcable;

//import process.ActionAdress;
import process.ActionMultipleInput;
import process.DescisionMultipleInput;
import salt.Adress;

/**
 * ...
 * @author bb
 */
class _InputShipingAdress extends DescisionMultipleInput
{
	public function new()
	{
		super(
			[
				{
					ereg:~/[\s\S]*/i,
					input:
					{
						width:200,
						prefix: (Main.customer.contract.owner == null ?"": Main.customer.contract.owner.name )+ " c/o",
						position:bottom
					}
				},
				{
					ereg:~/.{2,}/ig,
					input:
					{
						width:200,
						prefix:"street",
						position:bottom
					}
				},
				{
					ereg:~/\d+\w?/g,
					input:
					{
						width:50,
						prefix:"n°",
						position:right
					}
				},
				{
					ereg:~/^\d{4}$/g,
					input:
					{
						width:50,
						prefix:"zip",
						position:right
					}
				},
				{
					ereg:~/\w+[a-z 0-9.éàèüöäâêô!ï()\/\-']+/i,
					input:
					{
						width:140,
						prefix:"city",
						position:right
					}
				}
			]
		);
	}
	override public function create()
	{
		//this._nextProcesses = [new _FiberCableByPost()];
		this._nextNoProcesses = [new _FiberCableByPost()];
		this._nextYesProcesses = [ new _FiberCableByPost()];
		super.create();
		//trace(Main.customer);
		if (Main.customer.contract.address!= null)
		{
			multipleInputs.inputs.get("street").inputtextfield.text = Main.customer.contract.address._street;
			multipleInputs.inputs.get("n°").inputtextfield.text = Main.customer.contract.address._number;
			multipleInputs.inputs.get("zip").inputtextfield.text = Main.customer.contract.address._zip;
			multipleInputs.inputs.get("city").inputtextfield.text = Main.customer.contract.address._city;
		}
		
	}
	override public function onYesClick():Void
	{
		if (validate())
		{
			Main.customer.shipingAdress = new Adress(
				this.multipleInputs.inputs.get("street").getInputedText(),
				this.multipleInputs.inputs.get("n°").getInputedText(),
				this.multipleInputs.inputs.get("zip").getInputedText(),
				this.multipleInputs.inputs.get("city").getInputedText(),
				this.multipleInputs.inputs.get((Main.customer.contract.owner == null ?"": Main.customer.contract.owner.name )+ " c/o").getInputedText()
				//streetUI.getInputedText(),
				//numStreetUI.getInputedText(),
				//zipUI.getInputedText(),
				//cityUI.getInputedText(),
				//careOfUI.getInputedText()
			);
			super.onYesClick();
		}
	}
}