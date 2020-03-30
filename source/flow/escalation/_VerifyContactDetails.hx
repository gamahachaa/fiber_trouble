package flow.escalation;

import process.Action;

/**
 * ...
 * @author ...
 */
class _VerifyContactDetails extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Vérifier les données du client et faites le confirmer ces derniers";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextProcesses = [ new _AddEscalationMemo()];
		super.create();
	}
	
}