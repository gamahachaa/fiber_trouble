package flow.stability;

import flow.wifi._ConnectWiFIToFiveGH;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HasLANDevice extends Descision 
{

	override public function create()
	{
		//this._nextNoProcesses = [new _OpenSpeedTest()];
		//this._nextNoProcesses = [new _ConnectWiFIToFiveGH()];
		this._nextNoProcesses = [new HasWifiDevice()];
		//this._nextYesProcesses = [new _OpenSpeedTest()];
		this._nextYesProcesses = [new _OpenSpeedTest()];
		super.create();
	}
	
}