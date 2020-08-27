package flow.wifi;

import flow.lan._CreateLanIssueTicket;
import flow.wifi._CreateTicketWifiIssue;
import flow.all.fiberbox._LoopResetFiberBox;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class WifiVisibleByAppleTV extends Descision
{

	override public function create():Void
	{
		//this.prepareForIteration(this);
		//this._titleTxt = "Le WiFi est visible par l'apple TV ?";
		//this._detailTxt = "(Débrancher le câble LAN de l'AppleTV au préalable)";
		//this._illustration = "";
		this._nextYesProcesses = [new WifiVisibleOnDevice()];
		if (Main.HISTORY.isInHistory("flow.lan.TestWithAnotherLanDevice", Next))
		{
			this._nextNoProcesses = [new _CreateLanIssueTicket()];
		}
		else
			this._nextNoProcesses = [new _LoopResetFiberBox(),new _CreateTicketWifiIssue()];
		super.create();
	}

}