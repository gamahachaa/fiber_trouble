package flow.lan;

import flow.lan.ConnectDirectToFiberbox;
import flow.lan._RemoveAllCablesConnectedToBox;
import process.Descision;

/**
 * ...
 * @author ...
 */
class ConnectedViaSwitch extends Descision
{

	override public function create():Void
	{
		//this._titleTxt = "L'appareil est connecté via un switch";
		//this._detailTxt = "(pas directement sur la box)";
		//this._illustration = "";
		this._nextYesProcesses = [new ConnectDirectToFiberbox()];
		this._nextNoProcesses = [new _RemoveAllCablesConnectedToBox()];
		super.create();
	}
}