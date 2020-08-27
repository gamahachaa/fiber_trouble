package flow.salttv;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WhiteLightLids extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _RepairProcess()];
		this._nextYesProcesses = [new IsAppleTVvisibleOnTVScreen()];
		super.create();
	}
	
}