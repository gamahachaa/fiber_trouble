package flow.lan;

import flow.all.fiberbox._LoopResetFiberBox;
import flow.all.vti._AddMemoVti;
import flow.lan._CreateLanIssueTicket;
import flow.wifi.WifiOnInDashboard;
import flow.wifi._CreateTicketWifiIssue;
import process.Descision;

/**
 * ...
 * @author ...
 */
class LanConnectionOK extends Descision
{

	override public function create():Void
	{
		//trace(Main.HISTORY.history);
		if (Main.HISTORY.isInHistory("flow.all.fiberbox._LoopResetFiberBox", Next))
		{
			//this._nextNoProcesses = [new _CreateLanIssueTicket()];
				this._nextNoProcesses = [new WifiOnInDashboard()];
		}
		else
			this._nextYesProcesses = [new _AddMemoVti()];
		//this._nextNoProcesses = [new _CreateLanIssueTicket()];

		if (Main.HISTORY.isInHistory("flow.lan.TestWithAppleTV", Yes) && !Main.HISTORY.isInHistory("flow.lan.TestWithAnotherLanDevice", Next))
		{
			this._nextNoProcesses = [new TestWithAnotherLanDevice()];
		}
		else if (Main.HISTORY.isInHistory("flow.lan.TestWithAnotherLanDevice", Next))
		{
			if (Main.HISTORY.isInHistory("flow.wifi.WhyCannotConnectWithLan", No))
			{
				// came from WiFi Issue
				this._nextNoProcesses = [new _CreateTicketWifiIssue()];
			}
			else if (Main.HISTORY.isInHistory("flow.all.fiberbox._LoopResetFiberBox", Next))
			{
				//this._nextNoProcesses = [new _CreateLanIssueTicket()];
				this._nextNoProcesses = [new WifiOnInDashboard()];
			}
			else
				this._nextNoProcesses = [new _LoopResetFiberBox()];
		}
		else
			this._nextNoProcesses = [new _SwapEthernetCable(), new _SwapEthernetPort(), new TestWithAppleTV()];
		super.create();
	}

}