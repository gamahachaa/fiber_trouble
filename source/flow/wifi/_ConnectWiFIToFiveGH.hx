package flow.wifi;

import flow.stability._OpenSpeedTest;
import flow.stability._SelectSaltServer;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ConnectWiFIToFiveGH extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new _OpenSpeedTest()];
		super.create();
	}
	
}