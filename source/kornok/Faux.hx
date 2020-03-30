package kornok;

import process.Action;

/**
 * ...
 * @author ...
 */
class Faux extends Action 
{

	override public function create():Void
	{

		this._detailTxt = "Tu devrais réviser ton Feunteun Aod";
		this._titleTxt = "";
		this._illustration = "kornok/faux-png";
		this._nextProcesses = [new IntroKornok()];
		super.create();
	}
	
}