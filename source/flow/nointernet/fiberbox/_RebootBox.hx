package flow.nointernet.fiberbox;

import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _RebootBox extends Action
{

	override public function create():Void
	{

		this._nextProcesses = [new FiberLedOff()];
		super.create();
	}
	
}