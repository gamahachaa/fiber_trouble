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
		var resetDone = Main.HISTORY.isInHistory("flow.all.fiberbox._LoopResetFiberBox", Yes);
		if (resetDone )
		{
			this._nextNoProcesses = [new _CreateTicketWifiIssue()];
		}
		else{
			var wva = new WifiVisibleOnDevice();
			this._nextNoProcesses = [new _LoopResetFiberBox(wva, wva)];
		}
		
		super.create();
	}

}