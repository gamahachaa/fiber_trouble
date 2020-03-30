package flow.salttv;

import process.Action;

/**
 * ...
 * @author bb
 */
class _RebootAppleTV extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new _ProblemSolved()];
		super.create();
	}
	
}