package flow.all.vti;

import process.Action;

/**
 * ...
 * @author ...
 */
class _AddMemoVti extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Ajouter un mémo dans VTI";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextProcesses = [new End()];
		super.create();
	}
	
}