package flow.equipment;

import process.Action;

/**
 * ...
 * @author bb
 */
class _SendParcelTrackingByEmail extends Action 
{

	override public function create()
	{
		this._nextProcesses = [];
		super.create();
	}
	
}