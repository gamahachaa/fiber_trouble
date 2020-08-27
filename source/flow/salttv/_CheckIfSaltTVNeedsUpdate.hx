package flow.salttv;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _CheckIfSaltTVNeedsUpdate extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new ProblemSolved()];
		super.create();
	}
}