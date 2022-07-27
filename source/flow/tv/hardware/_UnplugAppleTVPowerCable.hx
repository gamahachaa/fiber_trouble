package flow.tv.hardware;

import flow.tv.remote.DoesAppleTVLedBlinks;
import flow.tv.remote.WichRemote;
import flow.tv.remote.salttvv2._PressVolAndMenuTenSec;
import flow.tv.remote.siri._GetCloseToAppleTV;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _UnplugAppleTVPowerCable extends Action 
{

	override public function onClick():Void
	{
		//var remote = Main.HISTORY.findValueOfFirstClassInHistory( WichRemote, WichRemote.REMOTE_VERSION).value;
		this._nexts = switch (Main.HISTORY.findValueOfFirstClassInHistory( WichRemote, WichRemote.REMOTE_VERSION).value)
		{
			case WichRemote.SALT_V2 : [{step:_PressVolAndMenuTenSec, params: []}];
			case _ : [{step: _GetCloseToAppleTV, params: []}];
		}
		super.onClick();
	}
	
}