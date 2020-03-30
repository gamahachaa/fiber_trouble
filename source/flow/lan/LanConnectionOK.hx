package flow.lan;

import flow.all.fiberbox._LoopResetFiberBox;
import flow.all.vti._AddMemoVti;
import flow.lan._CreateLanIssueTicket;
import process.Descision;

/**
 * ...
 * @author ...
 */
class LanConnectionOK extends Descision
{

	override public function create():Void
	{
		//this._titleTxt = "La connexion en LAN fonctionne ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [new _AddMemoVti()];
		//this._nextNoProcesses = [new _CreateLanIssueTicket()];
		this._nextNoProcesses = [new _SwapEthernetCable(), new _SwapEthernetPort(), new CanCheckWithAppleTVorOtherDevice(), new _LoopResetFiberBox(),new _CreateLanIssueTicket()];
		super.create();
	}

}