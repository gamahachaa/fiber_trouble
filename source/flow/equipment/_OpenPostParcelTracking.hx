package flow.equipment;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _OpenPostParcelTracking extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new IsStatusReturned()];
		super.create();
	}
	
}