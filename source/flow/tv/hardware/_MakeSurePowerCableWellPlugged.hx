package flow.tv.hardware;

import tstool.process.Action;

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