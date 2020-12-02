package flow.escalation;

import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class LessThanFifteenDaysUntilSwitchDate extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _EscalateTicket, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _InformTicketIsBeingTreated, params: []}];
		super.onNoClick();
	}
}