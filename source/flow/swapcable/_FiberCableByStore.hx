package flow.swapcable;

import flow._AddMemoVti;
import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _FiberCableByStore extends Action
{

	override public function create():Void
	{

		//this._nextProcesses = [new flow._AddMemoVti()]; 
		this._nextProcesses = [new _FiberCableByPost()];
		super.create();
	}

}
