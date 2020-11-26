package flow.wifi;

import flow.lan.ConnectedViaSwitch;
import flow.wifi._CreateTicketWifiIssue;
import flow.wifi._SwitchOnWifiFromAdminConsole;
//import tstool.process.Descision;
import tstool.process.Triplet;

/**
 * ...
 * @author ...
 */
class CanConnectToBoxWithLAN extends Triplet
{

	override public function create():Void
	{
		//this._titleTxt = "Est-il possible de connecter un appareil en LAN ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [new ConnectedViaSwitch()];
		//this._nextNoProcesses = [new _CreateTicketWifiIssue()];
		this._nextNoProcesses = [new WhyCannotConnectWithLan()];
		this._nextMidProcesses = [new _CreateTicketWifiIssue()];
		super.create();
	}

}