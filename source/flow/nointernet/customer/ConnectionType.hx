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

		//trace(Main.HISTORY.isInHistory("flow.nointernet.customer._TellCustomerAllOkWithFiberCnx", Next));
		//trace(Main.HISTORY.isInHistory("flow.nointernet.customer.FiberCableIsSalt", Yes));
		//if (Main.HISTORY.isInHistory("flow.nointernet.customer._TellCustomerAllOkWithFiberCnx", Next))
		//{
			//this.move_to_next([new _RemoveAllCablesConnectedToBox()], Next);
		//}
		//else{
			//this._nextYesProcesses = [new ConnectedViaSwitch()];
		//}
		this._nextYesProcesses = [new ConnectedViaSwitch()];
		this._nextNoProcesses = [new WifiOnInDashboard()];
		super.create();
	}

}