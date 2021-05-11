package flow.ftth.status;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _CommunicateSwitchDate extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _CPESendingOngoingOrange, params: []}];
		super.onClick();
	}
	
}