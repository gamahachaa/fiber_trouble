package flow.nointernet.postLedChecks;

import flow.nointernet.customer.FiberCableChanged;
import tstool.process.Descision;

class WasInternetWorkingBefore extends Descision
{
	override public function create()
	{
		/**
		 * @todo String to Class<Process> / isInHistory
		 */

		if (Main.HISTORY.isInHistory("flow.nointernet.fiberbox.NormalRxValues", No) ||Main.HISTORY.isInHistory("flow.nointernet.fiberbox.NormalRxValues", Yes))
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