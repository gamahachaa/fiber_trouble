package flow.swapcable;

//import process.ActionAdress;
import flixel.FlxSubState;
//import tstool.process.ActionMultipleInput;
import tstool.process.DescisionMultipleInput;
import tstool.salt.Adress;


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
						position: [bottom, left]
					}
				},
				{
					ereg:~/.{2,}/ig,
					input:
					{
						buddy: (Main.customer.contract.owner == null ?"": Main.customer.contract.owner.name )+ " c/o",
						width:200,
						prefix:"street",
						position:[bottom, left]
					}
				},
				{
					ereg:~/\d+\w?/g,
					input:
					{
						buddy: "street",
						width:50,
						prefix:"n°",
						position:[top, right]
					}
				},
				{
					ereg:~/^\d{4}$/g,
					input:
					{
						buddy: "street",
						width:50,
						prefix:"zip",
						position:[bottom, left]
					}
				},
				{
					ereg:~/\w+[a-z 0-9.éàèüöäâêô!ï()\/\-']+/i,
					input:
					{
						buddy: "zip",
						width:140, 
						prefix:"city",
						position:[top, right]
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
	override public function onNoClick():Void
	{
		super.onNoClick();
	}
	override public function validateNo():Bool
	{
		return true;
	}
}