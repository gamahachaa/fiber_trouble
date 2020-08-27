package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsPOMOrderPhaseAccepted extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _SoOrderProcessStatusCheck()];
		this._nextYesProcesses = [new VtiTrackParcelVisible()];
		super.create();
	}
	
}