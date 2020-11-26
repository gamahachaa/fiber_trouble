package flow.stability;

import flow.salttv._InstallSpeedTestAplleTV;
import tstool.process.Descision;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class HasAppleTV extends Triplet 
{

	override public function create()
	{
		this._nextNoProcesses = [new HasLANDevice()];
		this._nextMidProcesses = [new HasLANDevice()];
		this._nextYesProcesses = [new _InstallSpeedTestAplleTV()];
		super.create();
	}
	
}