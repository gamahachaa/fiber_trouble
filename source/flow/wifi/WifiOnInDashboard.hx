package flow.wifi;

import flow.all.fiberbox._LoopResetFiberBox;
import flow.wifi._SwitchOnUsingButton;
import flow.wifi.CanConnectToBoxWithLAN;
import flow.wifi.WifiVisibleByAppleTV;
import process.Descision;

/**
 * ...
 * @author ...
 */
class WifiOnInDashboard extends Descision 
{
	override public function create():Void
	{
		//this.prepareForIteration(this);
		//this._titleTxt = "Est-ce-que les 2 WiFi sont verts dans sur le dashboard ?";
		//this._detailTxt = "Contrairement à cette image les icones du WiFi doivent être vertes";
		//this._illustration = "vti/WifiOnInDashboard";
		//this._nextNoProcesses = [new SwitchOnUsingButton(), new ResetFiberBox(), new WifiButtonBroken()];
		this._nextNoProcesses = [new _SwitchOnUsingButton(), new _LoopResetFiberBox(), new CanConnectToBoxWithLAN(), new _CreateTicketWifiIssue()];
		this._nextYesProcesses = [new _MoveCloseUnplugRepeater()];
		//this._nextYesProcesses = [new UnplugLanAppleTV()];
		//this._nextYesProcesses = [];
		//this._nextNoProcesses = [];
		super.create();
	}
}