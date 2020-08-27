package flow.nointernet.vti;


//import flow.powercable.LedPowerOn;
import flow.nointernet.customer.HasCustomerLEXnetworkIssue;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class ActivationDone extends Descision
{

	override public function create():Void
	{
		this._nextYesProcesses = [new HasCustomerLEXnetworkIssue()];
		this._nextNoProcesses = [new _TroubleShootActivation()];
		super.create();
	}
	
}