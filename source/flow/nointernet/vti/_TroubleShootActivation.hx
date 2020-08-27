package flow.nointernet.vti;

import flow.End;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _TroubleShootActivation extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new flow.End()];
		super.create();
	}
	
}