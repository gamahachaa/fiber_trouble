package flow.tv.network;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ForgetWifiOnAppleTV extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new CanReconnectWiFi()];
		super.create();
	}
	
}