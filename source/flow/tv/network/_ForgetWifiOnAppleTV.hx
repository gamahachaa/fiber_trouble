package flow.tv.network;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ForgetWifiOnAppleTV extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: CanReconnectWiFi, params: []}];
		super.onClick();
	}
}