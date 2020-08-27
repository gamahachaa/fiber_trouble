package flow.powercable;

import flow.End;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _AddPowercableMemo extends Action 
{

	override public function create()
	{
		this._nextProcesses = [ new flow.End()];
		super.create();
	}
	
}