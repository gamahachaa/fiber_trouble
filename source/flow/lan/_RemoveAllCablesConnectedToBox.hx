package flow.lan;

import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _RemoveAllCablesConnectedToBox extends Action
{

	override public function create():Void
	{
		//this._titleTxt = "Retirer tous les autres câbles";
		//this._detailTxt = "Et refaire les tests";
		//this._illustration = "";
		this._nextProcesses = [new LanConnectionOK()];
		super.create();
	}

}