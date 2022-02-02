package flow.installation;

//import flow.nointernet.postLedChecks.WasInternetWorkingBefore;
//import ;
//import flow.nointernet.so._CreateTicketModemCNX;
import flow.nointernet.so._CreateTicketModemCNX;
import flow.swapcable.SwapFiberCable;
import flow.tickets.CustomerInstruction;
import tstool.process.Action;
import tstool.process.Process;

class _EnsureNoLanLoop extends Action 
{
	override public function onClick():Void
	{
		//var next:Class<Process> = if (Main.HISTORY.isClassInteractionInHistory(flow.nointernet.customer.FiberCableChanged, No)){
			//SwapFiberCable;
		//}
		//else{
			//_CreateTicketModemCNX;
		//}
		{step: CustomerInstruction, params: [
													{step: _CreateTicketModemCNX},
													{step: _CreateTicketModemCNX}
												]
			}
		if (Main.HISTORY.isClassInteractionInHistory(flow.nointernet.customer.FiberCableChanged, No)){
			//SwapFiberCable;
			this._nexts = [{step: SwapFiberCable, params: []}];
		}
		else{
			this._nexts = [{step: CustomerInstruction, params: [
													{step: _CreateTicketModemCNX},
													{step: _CreateTicketModemCNX}
												]
			}];
		}
		
		super.onClick();
	}
}