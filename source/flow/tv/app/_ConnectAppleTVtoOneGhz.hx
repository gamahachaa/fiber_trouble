package flow.tv.app;

import flow.lan.LanConnectionOK;
//import flow.stability.HasAppleTV;
//import flow.stability.WasREbootDone;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ConnectAppleTVtoOneGhz extends Action 
{

	override public function create()
	{
		this._nextProcesses = [ new LanConnectionOK() ];
	
		super.create();
	}
	
}