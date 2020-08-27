package flow.wifi;

import flow.lan._CreateLanIssueTicket;
import flow.wifi._CreateTicketWifiIssue;
import flow.all.fiberbox._LoopResetFiberBox;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class ErrorIconOnWifiIcon extends Descision
{

	override public function create():Void
	{
		//this._titleTxt = "Erreur sur l'Icone du WiFi ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [new _LoopResetFiberBox(), new _CreateTicketWifiIssue()];
		if (Main.HISTORY.isInHistory("flow.lan.TestWithAnotherLanDevice", Next))
		{
			this._nextNoProcesses = [new _CreateLanIssueTicket()];
		}
		else
			this._nextNoProcesses = [new _CreateTicketWifiIssue()];
		super.create();
	}

}