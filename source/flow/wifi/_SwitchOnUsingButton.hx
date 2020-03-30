package flow.wifi;

import process.Action;

/**
 * ...
 * @author ...
 */
class _SwitchOnUsingButton extends Action
{

	override public function create():Void
	{
		//this._titleTxt = "Appuyer sur le bouton en facade";
		//this._detailTxt = "Pendant X secondes";
		//this._illustration = "box/box_front_wlan";
		this._nextProcesses = [new WifiOnInDashboard()];
		super.create();
	}
}