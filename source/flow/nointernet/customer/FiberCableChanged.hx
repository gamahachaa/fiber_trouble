package flow.nointernet.customer;

import flow.nointernet.postLedChecks._ReadRXValues;
import flow.nointernet.so._CreateTicketModemCNX;
import flow.stability._CreateSOTechModemSpeed;
//import flow.nointernet.so._CreateTicketModemCNX;
import flow.swapcable.SwapFiberCable;
import process.Descision;

/**
 * ...
 * @author ...
 */
class FiberCableChanged extends Descision
{

	override public function create():Void
	{
		//this._titleTxt = "Le câble Fiber a été changé ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [new _ReadRXValues()];
		if (Main.HISTORY.isInHistory("flow.all.customer.IsSlowOrKaput", Yes) || Main.HISTORY.isInHistory("flow.all.customer.IsSlowOrKaput", Mid)) // Stability
		{
			this._nextYesProcesses = [new _CreateSOTechModemSpeed()];
		}
		else{
			this._nextYesProcesses = [new _CreateTicketModemCNX()];
		}
		//this._nextNoProcesses = [new SwapFiberCable()];
		this._nextNoProcesses = [new FiberCableIsSalt()];
		super.create();
	}

}