package flow.equipment;

import flow.all.vti._AddMemoVti;
import process.Action;

/**
 * ...
 * @author bb
 */
class _GiveStatusAndRemindMyaccount extends Action 
{

override public function create()
	{
		this._nextProcesses = [new _AddMemoVti()];
		super.create();
	}
}