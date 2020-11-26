package flow.tv.network;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HowConnected extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _EnsureLanCableWellPlugged()];
		this._nextYesProcesses = [new IsOtherWifiDeviceOK()];
		super.create();
	}
	
}