package flow.collection;

import flow.nointernet.vti.IconStatusBoxManagement;
import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _PaymentSearch extends Action 
{

	override public function create():Void
	{
		// this._titleTxt = "Lancer une recherche de paiement";
		// this._detailTxt = "";
		// this._illustration = "";
		this._nextProcesses = [ new IconStatusBoxManagement()];
		//this._nextProcesses = [ new _YouWillBeInformed()];
		super.create();
	}
	
}