package flow.salttv;

import process.Action;

/**
 * ...
 * @author bb
 */
class _QuitAndRelaunchSaltTV extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new ProblemSolved()];
		super.create();
	}
	
}