package flow.installation;

import flow.nointernet.postLedChecks.WasInternetWorkingBefore;
import flow.nointernet.postLedChecks._ReadRXValues;
import process.Action;

class _EnsureNoLanLoop extends Action {
    override public function create():Void
        {
            //this._nextProcesses = [new _EnsureCorrectPortPlug()];
            this._nextProcesses = [new _ReadRXValues()];
            super.create();
        }
}