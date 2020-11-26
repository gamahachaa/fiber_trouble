package flow.collection;

import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class PayedAlready extends Descision 
{

	override public function create():Void
	{
		//this._titleTxt = "Le client dit avoir déjà payé ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [ new MoreThanFiveDaysAgo()];
		this._nextNoProcesses = [ new ForgotToPay()];
		super.create();
	}
	
}