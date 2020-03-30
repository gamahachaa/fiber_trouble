package flow.nointernet.vti;

import flow.End;
import process.Action;

/**
 * ...
 * @author bb
 */
class _TroubleShootActivation extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new End()];
		super.create();
	}
	
}