package flow.wifi;

import flow.all.fiberbox._LoopResetFiberBox;
import flow.lan._CreateLanIssueTicket;
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

		this._nextNoProcesses = [new _SwitchOnUsingButton(), Main.HISTORY.findStepsInHistory("flow.all.fiberbox._LoopResetFiberBox").length>0?  new _CreateTicketWifiIssue(): new _LoopResetFiberBox(), new _CreateTicketWifiIssue()];
		
		var wvd = new WifiVisibleOnDevice();
		this._nextYesProcesses = [new _MoveCloseUnplugRepeater(wvd,wvd)];
		super.create();
	}
}