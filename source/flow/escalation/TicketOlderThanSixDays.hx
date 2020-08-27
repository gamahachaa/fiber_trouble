package flow.escalation;

import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class TicketOlderThanSixDays extends Descision 
{

	override public function create():Void
	{
		//this._titleTxt = "Le ticket est vieux de 6 jours ou plus ?";
		//this._detailTxt = "";
			//
		//this._illustration = "";
		this._nextYesProcesses = [ new _EscalateTicket()];
		this._nextNoProcesses = [ new _InformTicketIsBeingTreated()];
		super.create();
	}
	
}