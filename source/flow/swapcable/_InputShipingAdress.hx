package flow.swapcable;

import process.ActionAdress;
import salt.Adress;

/**
 * ...
 * @author bb
 */
class _InputShipingAdress extends ActionAdress 
{
	override public function create()
	{
		this._nextProcesses = [new _FiberCableByPost()];
		super.create();
	}
	override public function onClick():Void
	{
		Main.customer.shipingAdress = new Adress( 
			streetUI.getInputedText(),
			numStreetUI.getInputedText(),
			zipUI.getInputedText(),
			cityUI.getInputedText(),
			careOfUI.getInputedText()
		);
		super.onClick();
	}
}