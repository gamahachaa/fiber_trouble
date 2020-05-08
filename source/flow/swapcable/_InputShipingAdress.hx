package flow.swapcable;

//import process.ActionAdress;
import process.ActionMultipleInput;
import salt.Adress;

/**
 * ...
 * @author bb
 */
class _InputShipingAdress extends ActionMultipleInput
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
						prefix:"c/o",
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
						prefix:"N°",
						position:bottom
					}
				},
				{
					ereg:~/^\d{4}$/g,
					input:
					{
						width:50,
						prefix:"zip",
						position:bottom
					}
				},
				{
					ereg:~/\w+[a-z 0-9.éàèüöäâêô!ï()\/\-']+/i,
					input:
					{
						width:150,
						prefix:"city",
						position:right
					}
				}
			]
		);
	}
	override public function create()
	{
		this._nextProcesses = [new _FiberCableByPost()];
		super.create();
	}
	override public function onClick():Void
	{
		Main.customer.shipingAdress = new Adress(
			this.multipleInputs.inputs.get("street").getInputedText(),
			this.multipleInputs.inputs.get("N°").getInputedText(),
			this.multipleInputs.inputs.get("zip").getInputedText(),
			this.multipleInputs.inputs.get("city").getInputedText(),
			this.multipleInputs.inputs.get("c/o").getInputedText()
			//streetUI.getInputedText(),
			//numStreetUI.getInputedText(),
			//zipUI.getInputedText(),
			//cityUI.getInputedText(),
			//careOfUI.getInputedText()
		);
		super.onClick();
	}
}