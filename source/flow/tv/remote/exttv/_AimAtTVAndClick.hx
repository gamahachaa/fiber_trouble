package flow.tv.remote.exttv;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _AimAtTVAndClick extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new MenuVoluemDisplaysOnTV()];
		super.create();
	}
	
}