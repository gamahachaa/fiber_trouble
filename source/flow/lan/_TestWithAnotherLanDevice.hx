package flow.lan;

import tstool.process.Action;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class _TestWithAnotherLanDevice extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new LanConnectionOK()];
		super.create();
	}
	
}