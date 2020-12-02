package flow.escalation;

import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _VerifyContactDetails extends Action 
{

	//override public function create():Void
	//{
		//this._nextProcesses = [ new _AddEscalationMemo()];
		//super.create();
	//}
	override public function onClick():Void
	{
		this._nexts = [{step: _AddEscalationMemo, params: []}];
		super.onClick();
	}
}