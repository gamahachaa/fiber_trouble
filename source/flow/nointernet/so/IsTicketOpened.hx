package flow.nointernet.so;

import flow.escalation.IsTechTicket;
import flow.nointernet.vti.ActivationDone;
//import flow.nointernet.vti.IsBarred;
import process.Descision;


/**
 * ...
 * @author
 */
class IsTicketOpened extends Descision
{

	override public function create():Void
	{
		//this._nextYesProcesses = [new IsCustomerRecaller()];
		//this._nextYesProcesses = [new _VerifyContactDetails()];
		this._nextYesProcesses = [new IsTechTicket()];
		//this._nextNoProcesses =  [new IsBarred()];
		this._nextNoProcesses =  [new ActivationDone()];
		super.create();
	}

}