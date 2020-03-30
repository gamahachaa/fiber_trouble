package flow.wifi;

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
		this._nextNoProcesses = [new _LoopResetFiberBox(new WifiVisibleOnDevice()),new _CreateTicketWifiIssue()];
		super.create();
	}

}