package flow.escalation;

import flow.all.vti._AddMemoVti;
import process.Action;

/**
 * ...
 * @author ...
 */
class _SendMifiMail extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Envoyer un email";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextProcesses = [new _VerifyContactDetails()];
		super.create();
	}
}