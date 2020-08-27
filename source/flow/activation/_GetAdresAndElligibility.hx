package flow.activation;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _GetAdresAndElligibility extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new WhereWasOrderDone()];
		super.create();
	}
	
}