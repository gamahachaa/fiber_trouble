package flow.collection;

import flow._AddMemoVti;
import flow.nointernet.vti.IconStatusBoxManagement;
import tstool.process.Action;

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
		this._nextProcesses = [ new _AddMemoVti()];
		super.create();
	}
	
}