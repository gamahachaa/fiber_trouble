package flow.collection;

import process.Descision;

/**
 * ...
 * @author ...
 */
class IsBillChallenged extends Descision 
{

	override public function create():Void
	{
		//this._titleTxt = "Est-ce que le client remet en cause la facture ?";
		//this._detailTxt = "Ou aussi les frais de rappel ?";
		//this._illustration = "";
		this._nextYesProcesses = [ new _ExplainReasons()];
		this._nextNoProcesses = [ new IsTechnicalReasons()];
		super.create();
	}
	
}