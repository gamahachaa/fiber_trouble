package flow.nointernet.fiberbox;

import flow.nointernet.vti.ActivationDone;
import flow.nointernet.vti.IsBarred;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsBoxReachable extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [ new ActivationDone()];
		this._nextYesProcesses = [new IsBarred()];
		super.create();
	}
	
}