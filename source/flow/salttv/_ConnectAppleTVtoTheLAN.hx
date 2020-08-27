package flow.salttv;

import flow.stability._OpenSpeedTest;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ConnectAppleTVtoTheLAN extends Action 
{

	override public function create()
	{
		//this._nextProcesses = [new _OpenSpeedTest()];
		this._nextProcesses = [new _OpenSpeedTest()];
		super.create();
	}
	
}