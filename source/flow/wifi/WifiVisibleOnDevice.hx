package flow.wifi;

//import flow.lan._CreateLanIssueTicket;
import flow.tickets.CustomerInstruction;
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
		var n:Array<ProcessContructor> = [
			{step: _RestartDevice},
			{step: WifiVisibleByAppleTV}
		];
		n.push(
			if (Main.HISTORY.isClassInteractionInHistory(flow.wifi.WifiVisibleByAppleTV, Yes))
			{
			    {step: _ConteactDeviceSupport}
			}
			else{
				{step: CustomerInstruction, params: [{step: _CreateTicketWifiIssue},{step: _CreateTicketWifiIssue}]}
			}
		);
		this._nexts = n;
		super.onNoClick();
	}
}