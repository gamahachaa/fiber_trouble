package flow.nointernet.fiberbox;

import flow.lan._SwapEthernetCable;
import flow.nointernet.so._CreateTicketModemCNX;
import flow.nointernet.vti.ActivationDone;
import flow.nointernet.vti.IsBarred;
import flow.swapcable.SwapFiberCable;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsBoxReachable extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [ new ActivationDone(), new SwapFiberCable()];
		this._nextYesProcesses = [new IsBarred()];
		super.create();
	}
	
}