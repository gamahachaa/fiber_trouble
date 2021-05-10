package flow.escalation;

import flow.escalation.IsMifiNeeded;
import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _InformTicketIsBeingTreated extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: IsMifiNeeded, params: []}];
		super.onClick();
	}
}