package flow.installation;

import flow.nointernet.customer.FiberCableIsSalt;
import process.Action;

/**
 * ...
 * @author bb
 */
class _CheckSFP extends Action 
{
	override public function create()
	{
		this._nextProcesses = [new FiberCableIsSalt()];
		super.create();
	}
	
}