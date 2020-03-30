package flow.nointernet.postLedChecks;

import flow.nointernet.customer.FiberCableChanged;
import process.Descision;

class WasInternetWorkingBefore extends Descision{
    override public function create()
        {
            //this._titleTxt = "Aucne valeur RX et icon Rouge ?";
            //this._nextYesProcesses = [new _ReadRXValues()];
            this._nextYesProcesses = [new FiberCableChanged()];
            //this._nextNoProcesses = [new _ReadSerialNumber()];
            this._nextNoProcesses = [new IsSerialNumberCorrect()];
            super.create();
        }
}