package flow.escalation;

import process.Descision;

/**
 * ...
 * @author ...
 */
class IsTechTicket extends Descision 
{

	override public function create():Void
	{
		//this._titleTxt = "Il s'agit d'un ticket 521, 523 ou 524 ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [ new _EmailTLtech()];
		this._nextNoProcesses = [ new IsMoveOrTermTicket()];
		super.create(); 
	}
	
}