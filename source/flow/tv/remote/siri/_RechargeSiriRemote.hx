package flow.tv.remote.siri;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _RechargeSiriRemote extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new _GetCloseToAppleTV()];
		super.create();
	}
	
}