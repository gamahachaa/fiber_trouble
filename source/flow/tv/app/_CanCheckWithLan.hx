package flow.tv.services;

import flow.salttv._ConnectAppleTVtoOneGhz;
import flow.wifi._MoveCloseUnplugRepeater;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class _CanCheckWithLan extends Descision 
{
	override public function create()
	{
		this._nextNoProcesses = [ new _IsIssueWithOtherApps()];
		this._nextYesProcesses = [new _ConnectAppleTVtoOneGhz()];
		super.create();
	}
	
}