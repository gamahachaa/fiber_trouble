package flow.salttv;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ChekSaltTVKNownBugs extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new _QuitAndRelaunchSaltTV()];
		super.create();
	}
}