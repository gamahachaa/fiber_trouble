package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsWhishDateWayAhead extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _ExplainToWait, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsPOMOrderPhaseAccepted, params: []}];
		super.onNoClick();
	}
}