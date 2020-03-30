package flow.swapcable;

import flow.all.vti._AddMemoVti;
import process.Action;

/**
 * ...
 * @author ...
 */
class _FiberCableByStore extends Action
{

	override public function create():Void
	{

		//this._nextProcesses = [new _AddMemoVti()]; // CORONA exception
		this._nextProcesses = [new IsShipingToAnotherAdress()];
		super.create();
	}

}