package flow.nointernet.customer;

import flow.nointernet.postLedChecks._ReadRXValues;
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
		this._nextNoProcesses = [new SwapFiberCable()];
		super.create();
	}

}