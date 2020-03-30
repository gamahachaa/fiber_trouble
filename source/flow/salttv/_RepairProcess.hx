package flow.salttv;

import flow.End;
import process.Action;

/**
 * ...
 * @author bb
 */
class _RepairProcess extends Action 
{
	override public function create()
	{
		this._nextProcesses = [new End()];
		super.create();
	}
}