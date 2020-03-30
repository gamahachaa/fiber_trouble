package flow.equipment;

import process.Descision;

/**
 * ...
 * @author bb
 */
class IsWhishDateWayAhead extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new IsPOMOrderPhaseAccepted(];
		this._nextYesProcesses = [new _ExplainToWait()];
		super.create();
	}
	
}