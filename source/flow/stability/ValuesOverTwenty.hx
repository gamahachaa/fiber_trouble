package flow.stability;

import process.Descision;

/**
 * ...
 * @author ...
 */
class ValuesOverTwenty extends Descision 
{

	override public function create():Void
	{
		//this._titleTxt = "valeurs supérieur ou égales à 20Mbps ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [ new _CNXallGooodMan()];
		this._nextNoProcesses = [ new _RedoTestAndWthOtherNTW(),new _BadOutstandingFlows()];
		super.create();
	}
	
}