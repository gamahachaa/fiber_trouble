package flow.lan;

import flow.lan._CreateLanIssueTicket;
import process.Descision;

/**
 * ...
 * @author ...
 */
class TestWithAppleTV extends Descision
{

	override public function create():Void
	{
		//this._titleTxt = "Est-il possible d'essayer avec un autre appareil ?";
		//this._detailTxt = "Si l'AppleTV est dipo, essayer avec sinon un autre appareil en LAN.";
		//this._illustration = "";
		this._nextYesProcesses = [new LanConnectionOK ()];
		this._nextNoProcesses = [new _TestWithAnotherLanDevice()];
		super.create();
	}

}