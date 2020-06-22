package flow.stability;

import flow.salttv._InstallSpeedTestAplleTV;
import process.Descision;

/**
 * ...
 * @author bb
 */
class HasAppleTV extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new HasLANDevice()];
		this._nextYesProcesses = [new _InstallSpeedTestAplleTV()];
		super.create();
	}
	
}