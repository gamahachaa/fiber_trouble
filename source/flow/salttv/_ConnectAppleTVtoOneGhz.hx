package flow.salttv;

import process.Action;

/**
 * ...
 * @author bb
 */
class _ConnectAppleTVtoOneGhz extends Action 
{

	override public function create()
	{
		this._nextProcesses = [ new _InstallSpeedTestAplleTV() ];
		super.create();
	}
	
}