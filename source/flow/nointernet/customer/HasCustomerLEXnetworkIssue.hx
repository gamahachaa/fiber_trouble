package flow.nointernet.customer;

import flow.all.vti._AddMemoVti;
import flow.nointernet.so.IsTicketOpened;
import process.Descision;

/**
 * ...
 * @author bb
 */
class HasCustomerLEXnetworkIssue extends Descision 
{
	override public function create()
	{
		this._nextNoProcesses = [new IsTicketOpened()];
		this._nextYesProcesses = [new _AddMemoVti()];
		super.create();
	}
}