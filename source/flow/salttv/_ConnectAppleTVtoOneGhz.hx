package flow.salttv;

import flow.stability.HasAppleTV;
import flow.stability.WasREbootDone;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ConnectAppleTVtoOneGhz extends Action 
{

	override public function create()
	{
		if (Main.HISTORY.isInHistory("flow.salttv.HasAppleAccount", Yes))
		{
			this._nextProcesses = [ new _InstallSpeedTestAplleTV() ];
		}else
			this._nextProcesses = [ new WasREbootDone() ];
		//this._nextProcesses = [ new HasAppleTV() ];
		super.create();
	}
	
}