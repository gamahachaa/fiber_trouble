package flow.wifi;

import flow.wifi._SwitchOnWifiFromAdminConsole;
import flow.wifi.CanConnectToBoxWithLAN;
import process.Descision;

/**
 * ...
 * @author ...
 */
class WifiButtonBroken extends Descision
{

	override public function create():Void
	{
		//this._titleTxt = "Le bouton de WiFi est-il cassé ?";
		//this._detailTxt = "(quand on appuie dessus, il ne revient pas à sa position initiale)";
		//this._illustration = "";
		this._nextYesProcesses = [new _SwitchOnWifiFromAdminConsole()];
		this._nextNoProcesses = [new CanConnectToBoxWithLAN()];
		super.create();
	}

}