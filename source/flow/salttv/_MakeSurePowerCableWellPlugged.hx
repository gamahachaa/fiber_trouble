package flow.salttv;

import process.Action;

/**
 * ...
 * @author bb
 */
class _MakeSurePowerCableWellPlugged extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new WhiteLightLids()];
		super.create();
	}
	
}