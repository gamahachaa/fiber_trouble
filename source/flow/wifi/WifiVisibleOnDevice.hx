package flow.wifi;

//import flow.lan._CreateLanIssueTicket;
import flow.wifi._RestartDevice;
import flow.wifi.WiFiPasswordAccepted;
import tstool.process.Process;

import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class WifiVisibleOnDevice extends Descision
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: WiFiPasswordAccepted, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [
			{step: _RestartDevice},
			{step: WifiVisibleByAppleTV},
			{step: Main.HISTORY.isClassInteractionInHistory(flow.wifi.WifiVisibleByAppleTV, Yes)? _ConteactDeviceSupport: _CreateTicketWifiIssue}
		];
		super.onNoClick();
	}
}