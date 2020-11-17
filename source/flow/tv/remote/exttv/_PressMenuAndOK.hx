package flow.tv.remote.exttv;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _PressMenuAndOK extends Action 
{
	override public function create()
	{
		this._nextProcesses = [new _AimAtTVAndClick()];
		super.create();
	}
	
}