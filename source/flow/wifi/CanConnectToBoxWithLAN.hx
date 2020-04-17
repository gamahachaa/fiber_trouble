package flow.wifi;

import flow.wifi._CreateTicketWifiIssue;
import flow.wifi._SwitchOnWifiFromAdminConsole;
import process.Descision;

/**
 * ...
 * @author ...
 */
class CanConnectToBoxWithLAN extends Descision
{

	override public function create():Void
	{
		//this._titleTxt = "Est-il possible de connecter un appareil en LAN ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [new _SwitchOnWifiFromAdminConsole()];
		//this._nextNoProcesses = [new _CreateTicketWifiIssue()];
		this._nextNoProcesses = [new WhyCannotConnectWithLan()];
		super.create();
	}

}