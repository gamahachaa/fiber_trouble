package flow.nointernet.fiberbox;

//import flow.installation._EnsureNoLanLoop;
import flow.nointernet.postLedChecks.IsSerialNumberCorrect;
import flow.nointernet.postLedChecks._ReadRXValues;
import tstool.process.Descision;
import flow.nointernet.customer.FiberCableChanged;
//import flow.nointernet.customer._TellCustomerAllOkWithFiberCnx;

class IsWWWLedGreen extends Descision {
	override public function create() {
		// this._titleTxt = "Aucne valeur RX et icon Rouge ?";
		this._nextNoProcesses = [new IsSerialNumberCorrect()];
		//this._nextYesProcesses = [new FiberCableChanged()];
		//this._nextYesProcesses= [new NormalRxValues()];
		this._nextYesProcesses= [new NormalRxValues()];
		super.create();
	}
}
