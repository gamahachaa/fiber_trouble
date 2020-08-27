package flow.nointernet.fiberbox;

import flow.installation.OTOPlugDamagedNotClicking;
//import flow.installation._EnsureCorrectPortPlug;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class FiberLedOff extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new FiberLedGreenStable()];
		this._nextYesProcesses = [new OTOPlugDamagedNotClicking()];
		super.create();
	}
	
}