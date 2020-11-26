package flow.equipment;

import flow._AddMemoVti;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _GiveStatusAndRemindMyaccount extends Action 
{

override public function create()
	{
		this._nextProcesses = [new flow._AddMemoVti()];
		super.create();
	}
}