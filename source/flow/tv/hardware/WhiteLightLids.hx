package flow.tv.hardware;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WhiteLightLids extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _CheckHDMIcnx, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _RepairProcess, params: []}];
		super.onNoClick();
	}
}