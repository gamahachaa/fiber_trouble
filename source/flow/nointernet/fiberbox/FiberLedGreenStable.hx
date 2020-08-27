package flow.nointernet.fiberbox;

import flow.installation.OTOPlugDamagedNotClicking;
//import flow.installation._EnsureCorrectPortPlug;
//import process.Descision;
import tstool.process.Triplet;
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
		this._nextNoProcesses = [new OTOPlugDamagedNotClicking()];
		this._nextMidProcesses = [new OTOPlugDamagedNotClicking()];
		super.create();
	}
	
}