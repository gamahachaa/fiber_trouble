package flow.tv.install;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _OpenAppleStore extends Action 
{
	override public function create()
	{
		this._nextProcesses = [new CanSeeSaltTVOnAppleStore()];
		super.create();
	}
}