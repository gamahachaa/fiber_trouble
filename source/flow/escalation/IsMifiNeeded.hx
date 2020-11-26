package flow.escalation;

import flow.escalation._SendMifiMail;
import tstool.process.Action;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class IsMifiNeeded extends Descision
{

	override public function create():Void
	{
		//this._titleTxt = "Proposer un MiFi";
		//this._detailTxt = "Only if customer has no other means to connect\n(No unlimited data with Salt Mobile)";
		//this._illustration = "";
		this._nextYesProcesses = [new _SendMifiMail()];
		this._nextNoProcesses = [new _VerifyContactDetails()];
		super.create();
	}
}