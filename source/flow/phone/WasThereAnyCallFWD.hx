package flow.phone;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WasThereAnyCallFWD extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: IsTheDeviceWorking, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsTheDeviceWorking, params: []}];
		super.onNoClick();
	}
}