package flow.nointernet.fiberbox;

import flow.installation._EnsureCorrectPortPlug;
import flow.nointernet.customer._TellCustomerAllOkWithFiberCnx;
import process.Descision;

/**
 * ...
 * @author ...
 Changesd title to "RX values are normal ?"
 */
class NormalRxValues extends Descision
{
	override public function create()
	{
		//this._titleTxt = "RX est > -11 dBm ou RX < -18 dBm ?";
		//this._illustration = "vti/rx_values";
		//this._nextNoProcesses = [new _OpenSpeedTest()];
		this._nextNoProcesses = [new _EnsureCorrectPortPlug()];
		//this._nextYesProcesses = [new _TroubleShootActivation()];
		this._nextYesProcesses = [new _TellCustomerAllOkWithFiberCnx()];
		super.create();
	}
}