package flow.escalation;

import process.Action;

/**
 * ...
 * @author ...
 */
class _InformUpmostPrio extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Informer le client que le ticket sera traité avec priorité.";
		//this._detailTxt = "Il sera contacté dans le 48h";
		//this._illustration = "";
		this._nextProcesses = [ new IsMifiNeeded()];
		super.create();
	}
	
}