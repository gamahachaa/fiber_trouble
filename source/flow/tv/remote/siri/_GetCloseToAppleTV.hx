package flow.tv.remote.siri;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _GetCloseToAppleTV extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new _PressMenuAndPlus()];
		super.create();
	}
	
}