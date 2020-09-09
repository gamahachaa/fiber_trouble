package flow.installation;

import flow.nointernet.customer.FiberCableIsSalt;
import flow.nointernet.fiberbox._RebootBox;
import flow.nointernet.postLedChecks.WasInternetWorkingBefore;
import flow.powercable.LedPowerOn;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _CheckSFP extends Action 
{
	override public function create()
	{
		var nextafterreboot = new LedPowerOn();
		this._nextProcesses = [new _RebootBox(nextafterreboot,nextafterreboot)];
		super.create();
	}
	
}