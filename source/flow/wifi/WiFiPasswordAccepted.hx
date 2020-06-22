package flow.wifi;

import flow.lan._CreateLanIssueTicket;
import flow.wifi._CreateTicketWifiIssue;
import flow.all.fiberbox._LoopResetFiberBox;
import process.Descision;

/**
 * ...
 * @author ...
 */
class WiFiPasswordAccepted extends Descision
{

	override public function create():Void
	{
		//this._titleTxt = "Le mot de passe WiFi est accepté ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [new ErrorIconOnWifiIcon()];
		if (Main.HISTORY.isInHistory("flow.lan.TestWithAnotherLanDevice", Next))
		{
			this._nextNoProcesses = [new _CreateLanIssueTicket()];
		}
		else
			this._nextNoProcesses = [new _LoopResetFiberBox(new WifiVisibleOnDevice(),new WifiVisibleOnDevice()),new _CreateTicketWifiIssue()];
		super.create();
	}

}