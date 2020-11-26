package flow.wifi;

import flow.all.fiberbox._LoopResetFiberBox;
//import flow.lan._CreateLanIssueTicket;
import flow.wifi._SwitchOnUsingButton;
import flow.wifi.CanConnectToBoxWithLAN;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class WifiOnInDashboard extends Descision 
{
	override public function create():Void
	{
		/**
		 * @todo String to Class<Process> / isInHistory
		 */

		this._nextNoProcesses = [new _SwitchOnUsingButton(), Main.HISTORY.findStepsInHistory("flow.all.fiberbox._LoopResetFiberBox").length>0?  new _CreateTicketWifiIssue(): new _LoopResetFiberBox(), new CanConnectToBoxWithLAN()];
		
		var wvd = new WifiVisibleOnDevice();
		this._nextYesProcesses = [new _MoveCloseUnplugRepeater(wvd,wvd)];
		super.create();
	}
}