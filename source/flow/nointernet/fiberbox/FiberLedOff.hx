package flow.nointernet.fiberbox;

import flow.installation._EnsureCorrectPortPlug;
import process.Descision;

/**
 * ...
 * @author bb
 */
class FiberLedOff extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new FiberLedGreenStable()];
		this._nextYesProcesses = [new _EnsureCorrectPortPlug()];
		super.create();
	}
	
}