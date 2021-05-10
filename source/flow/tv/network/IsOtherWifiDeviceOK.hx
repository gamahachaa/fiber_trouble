package flow.tv.network;

import flow.wifi.WifiOnInDashboard;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsOtherWifiDeviceOK extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _ForgetWifiOnAppleTV, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: WifiOnInDashboard, params: []}];
		super.onNoClick();
	}
}