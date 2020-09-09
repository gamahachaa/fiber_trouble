package flow.nointernet.customer;

import flow._AddMemoVti;
import flow.nointernet.so.IsTicketOpened;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HasCustomerLEXnetworkIssue extends Descision 
{
	override public function create()
	{
		//this._nextNoProcesses = [new IsTicketOpened()];
		this._nextNoProcesses = [new FiberCableChanged()];
		this._nextYesProcesses = [new flow._AddMemoVti()];
		super.create();
	}
}