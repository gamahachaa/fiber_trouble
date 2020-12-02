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
						prefix: (Main.customer.contract.owner == null ?"": Main.customer.contract.owner.name ) + " c/o",
						debug: "chez Ernest & Bart",
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
						debug: "Sesame",
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
						debug: "69",
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
						debug: "2502",
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
						debug: "Montcuq",
						position:[top, right]
					}
				}
			]
		);
	}
	override public function create()
	{
		/**
		 * @KEEP
		 */
		super.create();
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
		if (validateYes())
		{
			Main.customer.shipingAdress = new Adress(
				this.multipleInputs.inputs.get("street").getInputedText(),
				this.multipleInputs.inputs.get("n°").getInputedText(),
				this.multipleInputs.inputs.get("zip").getInputedText(),
				this.multipleInputs.inputs.get("city").getInputedText(),
				this.multipleInputs.inputs.get((Main.customer.contract.owner == null ?"": Main.customer.contract.owner.name )+ " c/o").getInputedText()
			);
			this._nexts = [{step: _FiberCableByPost, params: []}];
			super.onYesClick();
		}
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _FiberCableByPost, params: []}];
		super.onNoClick();
	}
	override public function validateNo():Bool
	{
		return true;
	}
}