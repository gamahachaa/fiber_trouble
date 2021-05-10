package flow.swapcable;


import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class SwapFiberCable extends Descision
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _FiberCableByStore, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _InputShipingAdress, params: []}];
		super.onNoClick();
	}
}