package flow.lan;

import flow.lan.ConnectDirectToFiberbox;
import flow.lan._RemoveAllCablesConnectedToBox;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class ConnectedViaSwitch extends Descision
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: ConnectDirectToFiberbox, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _RemoveAllCablesConnectedToBox, params: []}];
		super.onNoClick();
	}
}