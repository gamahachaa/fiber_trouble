package flow.collection;

import flow.nointernet.vti.IconStatusBoxManagement;
import process.Action;

/**
 * ...
 * @author ...
 */
class _YouWillBeInformed extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Renseigner le client.";
		//this._detailTxt = "Nous vous contacterons bientôt pour vous informer du résultat !";
		//this._illustration = "";
		this._nextProcesses = [new IconStatusBoxManagement()];
		super.create();
	}
	
}