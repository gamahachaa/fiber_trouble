package flow.stability;

import flow.wifi._ConnectWiFIToFiveGH;
import process.Action;

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
		if (Main.HISTORY.isInHistory("flow.stability.HasLANDevice", No))
		{
			this._nextProcesses = [new _ConnectWiFIToFiveGH()];
		}
		else
			this._nextProcesses = [new _SelectSaltServer()];
		super.create();
	}
	
}