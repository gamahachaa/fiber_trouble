package flow.escalation;

import process.Descision;

/**
 * ...
 * @author ...
 */
class IsOrderTicket extends Descision 
{

	override public function create():Void
	{
		//this._titleTxt = "Est-ce un ticket commande 413, 414, 416 ou 511 ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [ new TicketOlderThanSixDays()];
		this._nextNoProcesses = [ new IsTechTicket()];
		super.create();
	}
	
}