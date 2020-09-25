package flow.tv.services;

import flow._AddMemoVti;
import flow.tv.app._QuitAndRelaunchSaltTV;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsSaltTVWorkingNow extends Descision 
{
	override public function create()
	{
		this._nextNoProcesses = [new _QuitAndRelaunchSaltTV()];
		this._nextYesProcesses = [new _AddMemoVti()];
		super.create();
	}
	
}