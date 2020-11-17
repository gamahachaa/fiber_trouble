package flow.installation;

//import flow.nointernet.postLedChecks.WasInternetWorkingBefore;
//import ;
//import flow.nointernet.so._CreateTicketModemCNX;
import flow.nointernet.so._CreateTicketModemCNX;
import flow.swapcable.SwapFiberCable;
import tstool.process.Action;
import tstool.process.Process;

class _EnsureNoLanLoop extends Action {
    override public function create():Void
        {
            //this._nextProcesses = [new _EnsureCorrectPortPlug()];
			var next:Process;
			if (Main.HISTORY.isInHistory("flow.nointernet.customer.FiberCableChanged", No))
			{
				next = new SwapFiberCable();
			}
			else
			{
				next = new _CreateTicketModemCNX();
			}
            this._nextProcesses = [next];
            super.create();
        }
}