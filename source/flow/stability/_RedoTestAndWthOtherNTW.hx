package flow.stability;

import process.Action;

/**
 * ...
 * @author ...
 */
class _RedoTestAndWthOtherNTW extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Refaire les test sur l'autre réseau WiFi";
		//this._detailTxt = "2,4Ghz <-> 5Ghz";
		//this._illustration = "";
		this._nextProcesses = [ new _SelectSaltServer() ];
		super.create();
	}
	
}