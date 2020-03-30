package flow.wifi;

import flow.wifi._RestartDevice;
import flow.wifi.WiFiPasswordAccepted;
import process.Descision;

/**
 * ...
 * @author ...
 */
class WifiVisibleOnDevice extends Descision
{

	override public function create():Void
	{
		//this._titleTxt = "Le WiFi est visible sur l'appareil ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [new WiFiPasswordAccepted()];
		this._nextNoProcesses = [new _RestartDevice(),new _ResetWifiParams(), new _ConteactDeviceSupport() ];
		super.create();
	}

}