package flow.collection;

import process.Descision;

/**
 * ...
 * @author ...
 */
class IsTechnicalReasons extends Descision 
{

	override public function create():Void
	{
		//this._titleTxt = "Le paiement n'a pas pu être fait pour des raison techniques ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextNoProcesses = [new _Pay()];
		this._nextYesProcesses = [new _ExplainReasons()];
		super.create();
	}
	
}