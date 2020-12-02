package flow.tv.app;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _RebootAppleTV extends Action 
{

	/*override public function create()
	{
		this._nextProcesses = [new ProblemSolved()];
		super.create();
	}*/
	override public function onClick():Void
	{
		this._nexts = [{step: ProblemSolved, params: []}];
		super.onClick();
	}
}