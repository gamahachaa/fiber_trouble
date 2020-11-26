package flow.wifi;

import flow.wifi._ConteactDeviceSupport;
import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _ResetWifiParams extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Faire un une remise à Zéro au réglages d'usine des paramètres WiFi de l'appareil";
		//this._detailTxt = "(Forget WiFi sur les appareil)";
		//this._illustration = "box/box_reset";
		this._nextProcesses = [new WifiVisibleOnDevice()];
		super.create();
	}
	
}