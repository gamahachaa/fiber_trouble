package flow.tv.app;


import tstool.process.Action;

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