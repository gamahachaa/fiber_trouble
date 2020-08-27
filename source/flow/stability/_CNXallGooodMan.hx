package flow.stability;

import flow._AddMemoVti;
import flow.nointernet.postLedChecks._ReadRXValues;
import flow.salttv._QuitAndRelaunchSaltTV;
import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _CNXallGooodMan extends Action
{

	override public function create():Void
	{
		//this._nextProcesses = [new _AddMemoVti()];//2020-04-02
		if (Main.HISTORY.isInHistory("flow.Intro", No) || Main.HISTORY.isInHistory("flow.salttv.IsImageJerky", Yes))
		{
			this._nextProcesses = [new _QuitAndRelaunchSaltTV()];
		}
		else
			this._nextProcesses = [new IsAnyServiceImpactedForNormalUse()];
			//this._nextProcesses = [new flow._AddMemoVti()];
		//this._nextProcesses = [new _ReadRXValues()];
		super.create();
	}

}