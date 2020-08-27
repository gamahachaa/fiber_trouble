package flow.escalation;

import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _EscalateTicket extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Escalader";
		//this._detailTxt = "216 vers 622\n215 vers 623 \n511 vers 611\n413 vers 612\n414 vers 613\n416 vers 621";
		//this._illustration = "";
		this._nextProcesses = [new _InformUpmostPrio()];
		super.create();
	}
	
}