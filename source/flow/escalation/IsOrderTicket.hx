package flow.escalation;

import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class IsOrderTicket extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: TicketOlderThanSixDays, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsTechTicket, params: []}];
		super.onNoClick();
	}
}