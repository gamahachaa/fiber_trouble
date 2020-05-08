package flow.salttv;

import flow.stability._OpenSpeedTest;
import process.Action;

/**
 * ...
 * @author bb
 */
class _InstallSpeedTestAplleTV extends Action 
{

	override public function create()
	{
		//this._nextProcesses = [new _OpenSpeedTest()];
		this._nextProcesses = [new _ConnectAppleTVtoTheLAN()];
		super.create();
	}
	
}