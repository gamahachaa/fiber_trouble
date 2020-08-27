package flow.wifi;

import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _SwitchOnWifiFromAdminConsole extends Action
{

	override public function create():Void
	{
		//this._titleTxt = "Depuis l'admin de la box faites activer les 2 WiFis";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextProcesses = [new WifiOnInDashboard()];
		super.create();
	}
}