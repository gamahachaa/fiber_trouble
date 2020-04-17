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
		this._nextYesProcesses = [new ConnectedViaSwitch()];
		this._nextNoProcesses = [new WifiOnInDashboard()];
		super.create();
	}

}