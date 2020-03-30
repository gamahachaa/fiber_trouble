package flow.nointernet.fiberbox;

import flow.installation._EnsureCorrectPortPlug;
//import process.Descision;
import process.Triplet;
// import flow.nointernet.customer._TellCustomerAllOkWithFiberCnx;

/**
 * ...
 * @author ...
 */
//class FiberLedGreenStable extends Descision 
class FiberLedGreenStable extends Triplet 
{

	override public function create():Void
	{
		//this._titleTxt = "La LED Fiber est verte et ne clignottes pas ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [new IsWWWLedGreen()];
		//this._nextNoProcesses = [new WasInternetWorkingBefore()];
		this._nextNoProcesses = [new _EnsureCorrectPortPlug()];
		this._nextMidProcesses = [new _EnsureCorrectPortPlug()];
		super.create();
	}
	
}