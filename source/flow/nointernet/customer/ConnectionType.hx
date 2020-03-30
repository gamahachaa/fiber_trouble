package flow.nointernet.customer;

import flow.lan.ConnectedViaSwitch;
import flow.lan._RemoveAllCablesConnectedToBox;
import flow.wifi.WifiOnInDashboard;
import process.Descision;

/**
 * ...
 * @author ...
 */
class ConnectionType extends Descision
{

	override public function create():Void
	{
		//this._titleTxt = "Sur quoi est connecté l'appareil du client ?";
		//this._detailTxt = "LAN ou WiFi";
		//this._illustration = "";
		//this._buttonNoTxt = "LAN";
		//this._buttonYesTxt = "WiFi";
		
		this._nextYesProcesses = [new ConnectedViaSwitch()];
		
		this._nextNoProcesses = [new WifiOnInDashboard()];
		super.create();
	}

}