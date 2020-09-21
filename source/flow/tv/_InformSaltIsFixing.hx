package flow.tv;

import flow._AddMemoVti;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _InformSaltIsFixing extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new _AddMemoVti()];
		super.create();
	}
	
}