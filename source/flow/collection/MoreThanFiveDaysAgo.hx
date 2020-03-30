package flow.collection;

import process.Descision;

/**
 * ...
 * @author ...
 */
class MoreThanFiveDaysAgo extends Descision 
{

	override public function create():Void
	{
		//this._titleTxt = "Il y à plus de 5 jours ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [ new _PaymentSearch()];
		this._nextNoProcesses = [ new IsPaymentOneHourOldVisible()];
		super.create();
	}
	
}