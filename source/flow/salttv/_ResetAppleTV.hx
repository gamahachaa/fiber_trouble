package flow.salttv;

import flow.nointernet.so.tckets._TvProblem;
import process.Action;

/**
 * ...
 * @author bb
 */
class _ResetAppleTV extends Action 
{

	override public function create()
	{
		this._nextProcesses = [ new _TvProblem()];
		super.create();
	}
	
}