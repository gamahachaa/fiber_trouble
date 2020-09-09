package flow.installation;

//import flow.nointernet.postLedChecks.WasInternetWorkingBefore;
//import ;
import flow.nointernet.so._CreateTicketModemCNX;
import tstool.process.Action;

class _EnsureNoLanLoop extends Action {
    override public function create():Void
        {
            //this._nextProcesses = [new _EnsureCorrectPortPlug()];
            this._nextProcesses = [new _CreateTicketModemCNX()];
            super.create();
        }
}