package flow.tv.app;


import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _QuitAndRelaunchSaltTV extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: ProblemSolved, params: []}];
		super.onClick();
	}
}