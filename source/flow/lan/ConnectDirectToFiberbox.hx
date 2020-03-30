package flow.lan;

import process.Action;

/**
 * ...
 * @author ...
 */
class ConnectDirectToFiberbox extends Action 
{
	override public function create():Void
	{
		//this._titleTxt = "Connect l'appareil en LAN sur la Box directement";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextProcesses = [new _RemoveAllCablesConnectedToBox()];
		super.create();
	}
}