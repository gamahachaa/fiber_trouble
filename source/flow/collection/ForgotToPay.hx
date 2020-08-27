package flow.collection;

import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class ForgotToPay extends Descision 
{

	override public function create():Void
	{
		// this._titleTxt = "Oublie de payer ?";
		// this._detailTxt = "";
		// this._illustration = "";
		this._nextYesProcesses = [ new _Pay()];
		this._nextNoProcesses = [ new IsBillChallenged()];
		super.create();
	}
	
}