package flow.stability;

import flow.wifi._ConnectWiFIToFiveGH;
import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _OpenSpeedTest extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Ouvrir salt.speedtest.net";
		//this._detailTxt = "Avec dans un navigateur ou depuis installer App";
		//this._illustration = "";
		//if (Main.HISTORY.isInHistory("flow.stability.HasLANDevice", No))
		//{
			//this._nextProcesses = [new _ConnectWiFIToFiveGH()];
		//}
		//else
			this._nextProcesses = [new _SelectSaltServer()];
		
		if (Main.HISTORY.isInHistory("flow.stability.HasWifiDevice", Yes))
		{
			this._titleTxt += " WiFi";
		}
		else if (Main.HISTORY.isInHistory("flow.stability.HasLANDevice", Yes))
		{
			this._titleTxt += " LAN";
		}
		else if (Main.HISTORY.isInHistory("flow.stability.HasAppleTV", Yes))
		{
			this._titleTxt += " Apple TV";
		}
		else{
			this._titleTxt += " WiFi";
		}
		super.create();
		
	}
	
}