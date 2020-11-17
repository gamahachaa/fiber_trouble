package flow.tv.network;

import flow.wifi.WifiOnInDashboard;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsOtherWifiDeviceOK extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [ new WifiOnInDashboard()];
		this._nextYesProcesses = [ new _ForgetWifiOnAppleTV()];
		super.create();
	}
	
}