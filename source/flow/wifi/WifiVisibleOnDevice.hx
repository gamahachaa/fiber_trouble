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

	override public function create():Void
	{
		this._nextYesProcesses = [new WiFiPasswordAccepted()];
		var nextNoFour:Process = null;
		if (Main.HISTORY.isInHistory("flow.wifi.WifiVisibleByAppleTV", Yes))
		{
			nextNoFour = new _ConteactDeviceSupport();
			//this._nextNoProcesses = [new _RestartDevice(),new _ResetWifiParams(), new _ConteactDeviceSupport() ];
		}
		else{
			nextNoFour = new _CreateTicketWifiIssue();
		}
		this._nextNoProcesses = [new _RestartDevice(), new WifiVisibleByAppleTV(),  nextNoFour ];
		//this._nextNoProcesses = [new _RestartDevice(), new _ResetWifiParams(), new WifiVisibleByAppleTV(),  nextNoFour ];
		super.create();
	}
}