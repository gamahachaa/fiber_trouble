package flow.all.customer;

import flow._AddMemoVti;
import tstool.process.Action;

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
		this._nextProcesses = [new flow._AddMemoVti()];
		super.create();
	}
}