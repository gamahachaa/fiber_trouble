package flow.installation;

import flow.nointernet.customer.FiberCableIsSalt;
import flow.nointernet.postLedChecks.WasInternetWorkingBefore;
import process.Action;

/**
 * ...
 * @author bb
 */
class _CheckSFP extends Action 
{
	override public function create()
	{
		this._nextProcesses = [new WasInternetWorkingBefore()];
		super.create();
	}
	
}