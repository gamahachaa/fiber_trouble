package flow.ftth.status;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsOrderAccepted extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _CommunicateSwitchDate, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsWhishDateWayAhead, params: []}];
		super.onNoClick();
	}
}