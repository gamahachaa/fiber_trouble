package flow.installation;

//import flow.nointernet.postLedChecks.WasInternetWorkingBefore;
//import ;
//import flow.nointernet.so._CreateTicketModemCNX;
import flow.nointernet.so._CreateTicketModemCNX;
import flow.swapcable.SwapFiberCable;
import tstool.process.Action;
import tstool.process.Process;

class _EnsureNoLanLoop extends Action 
{
	override public function onClick():Void
	{
		var next:Class<Process> = if (Main.HISTORY.isClassInteractionInHistory(flow.nointernet.customer.FiberCableChanged, No)){
			SwapFiberCable;
		}
		else{
			_CreateTicketModemCNX;
		}
		this._nexts = [{step: next, params: []}];
		super.onClick();
	}
}