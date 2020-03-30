package flow.wifi;

import flow.wifi._ResetWifiParams;
import process.Action;

/**
 * ...
 * @author ...
 */
class _RestartDevice extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Rebooter l'appareil";
		//this._detailTxt = "(reset box)";
		//this._illustration = "box/box_reset";
		//this._illustration = "box/box_reset";
		this._nextProcesses = [new WifiVisibleOnDevice()];
		super.create();
	}
	
}