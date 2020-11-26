package flow.wifi;

import flow.lan._CreateLanIssueTicket;
import flow.wifi._CreateTicketWifiIssue;
import flow.all.fiberbox._LoopResetFiberBox;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class WiFiPasswordAccepted extends Descision
{

	override public function create():Void
	{
		/**
		 * @todo String to Class<Process> / isInHistory
		 */
		this._nextYesProcesses = [new ErrorIconOnWifiIcon()];
		var resetDone = Main.HISTORY.isInHistory("flow.all.fiberbox._LoopResetFiberBox", Yes);
		if (resetDone )
		{
			this._nextNoProcesses = [new _CreateTicketWifiIssue()];
		}
		else{
			var wvd = new WifiVisibleOnDevice();
			this._nextNoProcesses = [new _LoopResetFiberBox(wvd,wvd),new _CreateTicketWifiIssue()];
		}
		super.create();
	}

}