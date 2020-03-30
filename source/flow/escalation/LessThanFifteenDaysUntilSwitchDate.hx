package flow.escalation;

import process.Descision;

/**
 * ...
 * @author ...
 */
class LessThanFifteenDaysUntilSwitchDate extends Descision 
{

	override public function create():Void
	{
		//this._titleTxt = "La switch date est dans moins de 15 jours ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [ new _EscalateTicket()];
		this._nextNoProcesses = [new _InformTicketIsBeingTreated()];
		super.create();
	}
	
}