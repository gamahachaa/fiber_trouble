package flow.ftth.status;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsQulalifDone extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: CHANGEME, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: CheckInCRMorSO, params: []}];
		super.onNoClick();
	}
}