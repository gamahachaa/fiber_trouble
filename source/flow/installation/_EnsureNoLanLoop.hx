package flow.installation;

//import flow.nointernet.postLedChecks.WasInternetWorkingBefore;
//import ;
import tstool.process.Action;

class _EnsureNoLanLoop extends Action {
    override public function create():Void
        {
            //this._nextProcesses = [new _EnsureCorrectPortPlug()];
            this._nextProcesses = [new flow.nointernet.postLedChecks._ReadRXValues()];
            super.create();
        }
}