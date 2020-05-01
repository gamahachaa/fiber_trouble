package flow.installation;

import flow.nointernet.so.tckets._WrongOTO;
import process.Descision;

class IsOTOidAligned extends Descision {
    override public function create():Void
        {
            //this._nextYesProcesses = [new FiberCableIsSalt()];
            this._nextYesProcesses = [new _CheckSFP()];
            this._nextNoProcesses = [new _WrongOTO()];
            super.create();
        }
}