package flow.escalation;

import flow._AddMemoVti;
import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _SendMifiMail extends Action 
{

	//override public function create():Void
	//{
		//this._nextProcesses = [new _VerifyContactDetails()];
		//super.create();
	//}
	override public function onClick():Void
	{
		this._nexts = [{step: _VerifyContactDetails, params: []}];
		super.onClick();
	}
}