package flow.stability;

import flow.all.vti._AddMemoVti;
import flow.nointernet.postLedChecks._ReadRXValues;
import flow.salttv._QuitAndRelaunchSaltTV;
import process.Action;

/**
 * ...
 * @author ...
 */
class _CNXallGooodMan extends Action
{

	override public function create():Void
	{
		//this._nextProcesses = [new _AddMemoVti()];//2020-04-02
		if (Main.HISTORY.isInHistory("flow.Intro", No))
		{
			this._nextProcesses = [new _QuitAndRelaunchSaltTV()];
		}
		else
			this._nextProcesses = [new _ReadRXValues()];
		super.create();
	}

}