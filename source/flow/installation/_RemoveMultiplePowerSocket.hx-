package flow.installation;

import process.Action;

/**
 * ...
 * @author ...
 */
class _RemoveMultiplePowerSocket extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Vérifier les branchements de la prise électrique";
		//this._detailTxt = "-Si la box est branchée sur un multiprise, brancher directement sur la prise murale.";
		//this._detailTxt += "\n-Essayer sur une autre prise murale";
		//this._illustration = "";
		this._nextProcesses = [new _EnsureNoLanLoop()];
		super.create();
	}
	
}