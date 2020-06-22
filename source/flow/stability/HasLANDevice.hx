package flow.stability;

import process.Descision;

/**
 * ...
 * @author bb
 */
class HasLANDevice extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _OpenSpeedTest()];
		this._nextYesProcesses = [new _OpenSpeedTest()];
		super.create();
	}
	
}