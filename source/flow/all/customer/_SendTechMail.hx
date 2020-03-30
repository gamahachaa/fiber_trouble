package flow.all.customer;

import flow.all.vti._AddMemoVti;
import process.Action;

/**
 * ...
 * @author ...
 */
class _SendTechMail extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Envoyer un email";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextProcesses = [new _AddMemoVti()];
		super.create();
	}
}