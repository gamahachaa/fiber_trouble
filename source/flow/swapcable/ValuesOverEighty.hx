package flow.stability;

import process.Descision;

/**
 * ...
 * @author ...
 */
class ValuesOverEighty extends Descision 
{

	override public function create():Void
	{
		//this._titleTxt = "Valeurs RX > 800 Mbps ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [ new _CNXallGooodMan() ];
		this._nextNoProcesses = [ new _BadOutstandingFlows()];
		super.create();
	}
	
}