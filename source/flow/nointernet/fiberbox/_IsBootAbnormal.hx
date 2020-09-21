package flow.nointernet.fiberbox;

import flow.nointernet.postLedChecks.IsSerialNumberCorrect;
import flow.nointernet.so._CreateTicketModemCNX;
import flow.nointernet.so.tckets._SwapBox;
import flow.swapcable.SwapFiberCable;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class _IsBootAbnormal extends Triplet 
{

	override public function create()
	{
		this._nextNoProcesses = [new IsSerialNumberCorrect()];
		this._nextYesProcesses = [new _SwapBox()];
		this._nextMidProcesses= [new SwapFiberCable()];
		super.create();
	}
	
}