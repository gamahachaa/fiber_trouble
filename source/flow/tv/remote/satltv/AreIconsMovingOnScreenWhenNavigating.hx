package flow.tv.remote.satltv;

import flow.salttv._OpenSaltTVApp;
import flow.tv.remote.satltv._SteupSaltTVRemoteWithRegularTV;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class AreIconsMovingOnScreenWhenNavigating extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _SteupSaltTVRemoteWithRegularTV()];
		this._nextYesProcesses = [new _OpenSaltTVApp()];
		super.create();
	}
	
}