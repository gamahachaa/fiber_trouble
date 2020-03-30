package flow.collection;

import flow.nointernet.vti.IconStatusBoxManagement;
import process.Action;

/**
 * ...
 * @author ...
 */
class ManuallyUnblock extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Débloque manuellement les services TV";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextProcesses = [ new IconStatusBoxManagement()];
		super.create();
	}
	
}