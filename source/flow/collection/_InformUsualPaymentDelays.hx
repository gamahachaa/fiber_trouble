package flow.collection;

import flow.nointernet.vti.IconStatusBoxManagement;
import process.Action;

/**
 * ...
 * @author ...
 */
class _InformUsualPaymentDelays extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Informer le client des déalis habituels";
		//this._detailTxt = "Selon la méthode choisie\n les paiements peuvent mettre 5 jours à arriver.";
		//this._illustration = "";
		this._nextProcesses = [new IconStatusBoxManagement()];
		super.create();
	}
	
}