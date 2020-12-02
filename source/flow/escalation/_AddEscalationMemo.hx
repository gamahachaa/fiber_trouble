package flow.escalation;

import flow.End;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _AddEscalationMemo extends Action 
{

	/*override public function create()
	{
		this._nextProcesses = [new flow.End()];
		super.create();
	}*/
	override public function onClick():Void
	{
		this._nexts = [{step: End, params: []}];
		super.onClick();
	}
}