package flow.salttv;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _RebootAppleTV extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new ProblemSolved()];
		super.create();
	}
	
}