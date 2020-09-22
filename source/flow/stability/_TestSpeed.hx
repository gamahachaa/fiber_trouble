package flow.stability;

import flow.nointernet.fiberbox._RebootBox;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class _TestSpeed extends Descision 
{
	override public function create()
	{
		this._nextYesProcesses = [ new _RebootBox(new _RedoTestWithAnotherDevice(),new _RedoTestWithAnotherDevice())];
		this._nextNoProcesses = [new _ShareAdviceOptimalWifi()];
		super.create();
	}
	
}