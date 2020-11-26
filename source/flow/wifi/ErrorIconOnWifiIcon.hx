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
		this._nextNoProcesses = [new _CanSeeGoogle()];
		this._nextYesProcesses = [new _CreateTicketWifiIssue()];
		super.create();
	}

}