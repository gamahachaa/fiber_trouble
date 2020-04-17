package flow.lan;

import process.Action;
import process.Descision;

/**
 * ...
 * @author bb
 */
class TestWithAnotherLanDevice extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new LanConnectionOK()];
		super.create();
	}
	
}