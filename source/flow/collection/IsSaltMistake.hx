package flow.collection;

import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class IsSaltMistake extends Descision 
{

	override public function create():Void
	{
		//this._titleTxt = "Est-ce une erreur crée par Salt ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [new _SoTicketTreeTwoOne()];
		this._nextNoProcesses = [new PayedAlready()];
		super.create();
	}
	
}