package flow.powercable;

import flow.End;
import process.Action;

/**
 * ...
 * @author bb
 */
class _AddPowercableMemo extends Action 
{

	override public function create()
	{
		this._nextProcesses = [ new End()];
		super.create();
	}
	
}