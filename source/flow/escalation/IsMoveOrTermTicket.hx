package flow.escalation;

import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class IsMoveOrTermTicket extends Descision 
{
	override public function create():Void
	{
		//this._titleTxt = "Est-ce un ticket déménagement 215 ou annulation 216 ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [ new LessThanFifteenDaysUntilSwitchDate()];
		this._nextNoProcesses = [ new IsOrderTicket()];
		super.create();
	}
	
}