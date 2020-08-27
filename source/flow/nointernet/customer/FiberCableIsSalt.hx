package flow.nointernet.customer;

import flow.nointernet.postLedChecks.WasInternetWorkingBefore;
import flow.swapcable.SwapFiberCable;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class FiberCableIsSalt extends Descision
{

	override public function create():Void
	{
		//this._titleTxt = "Le câble Fiber est un câble Salt ?";
		//this._detailTxt = "";
		//this._illustration = "";
		//this._nextYesProcesses = [new LedPowerOn()];
		this._nextYesProcesses = [new SwapFiberCable()];
		this._nextNoProcesses = [new SwapFiberCable()];
		super.create();
	}

}