package flow.nointernet.so;

import flow.equipment.IsWhishDateWayAhead;
import flow.escalation.IsTechTicket;
import flow.nointernet.vti.ActivationDone;
import flow.nointernet.vti.IconStatusBoxManagement;
//import flow.nointernet.vti.IsBarred;
import process.Descision;


/**
 * ...
 * @author
 */
class IsTicketOpened extends Descision
{

	override public function create():Void
	{
		this._nextYesProcesses = [new IsTechTicket()];
		if (Main.HISTORY.isInHistory("flow.all.customer.IsSlowOrKaput", Yes))
		{
			this._nextNoProcesses =  [new IconStatusBoxManagement()];
		}
		else if (Main.HISTORY.isInHistory("flow.Intro", Mid)){
			this._nextNoProcesses =  [new IsWhishDateWayAhead()];
		}
		else{
			this._nextNoProcesses =  [new ActivationDone()];
		}
		super.create();
	}

}