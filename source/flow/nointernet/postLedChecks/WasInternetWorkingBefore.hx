package flow.nointernet.postLedChecks;

import flow.nointernet.customer.FiberCableChanged;
import process.Descision;

class WasInternetWorkingBefore extends Descision
{
	override public function create()
	{
		//this._titleTxt = "Aucne valeur RX et icon Rouge ?";
		//this._nextYesProcesses = [new _ReadRXValues()];
		

		if (Main.HISTORY.isInHistory("flow.nointernet.fiberbox.NormalRxValues", No) )
		{
			this._nextYesProcesses = [new FiberCableChanged()];
			this._nextNoProcesses = [new FiberCableChanged()];
		}
		else{
			this._nextYesProcesses = [new _ReadRXValues()];
			this._nextNoProcesses = [new _ReadRXValues()];
		}

		//this._nextNoProcesses = [new _ReadSerialNumber()];
		//flow.nointernet.fiberbox.NormalRxValues
		if (Main.HISTORY.isInHistory("flow.nointernet.fiberbox.FiberLedGreenStable", Mid) )
		{
			this._nextNoProcesses = [new IsSerialNumberCorrect()];
		}
		

		super.create();
	}
}