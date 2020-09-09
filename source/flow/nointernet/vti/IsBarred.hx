package flow.nointernet.vti;

import flow.collection._VerifyCollectionStep;
import flow.lan.ConnectedViaSwitch;
import flow.nointernet.customer.ConnectionType;
import flow.wifi.WifiOnInDashboard;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class IsBarred extends Descision
{

	override public function create():Void
	{
		
		this._nextYesProcesses = [new _VerifyCollectionStep()];
		//this._nextNoProcesses = [new IconStatusBoxManagement()];
		if (Main.HISTORY.isInHistory("flow.all.customer.LanOrWiFi", Yes))
		{
			/******************************
			 * WIFI
			/******************************/
			this._nextNoProcesses = [new WifiOnInDashboard()];
		}
		else{
			/******************************
			 * LAN and/or WiFi
			/******************************/
			this._nextNoProcesses = [new ConnectedViaSwitch()];
		}
		super.create();
	}
}