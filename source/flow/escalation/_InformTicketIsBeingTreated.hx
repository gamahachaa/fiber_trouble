package flow.escalation;

import flow.escalation.IsMifiNeeded;
import process.Action;

/**
 * ...
 * @author ...
 */
class _InformTicketIsBeingTreated extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Informer le client que son ticket est en cours de traitement.";
		//this._detailTxt = "Nous allons le contacter prochainement.";
		//this._illustration = "";
		this._nextProcesses = [ new IsMifiNeeded()];
		super.create();
	}
	
}