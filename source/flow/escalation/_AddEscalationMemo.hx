package flow.escalation;

import flow.End;
import process.Action;

/**
 * ...
 * @author bb
 */
class _AddEscalationMemo extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new End()];
		super.create();
	}
}