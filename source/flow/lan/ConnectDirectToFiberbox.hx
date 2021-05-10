package flow.lan;

import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class ConnectDirectToFiberbox extends Action 
{
	
	override public function onClick():Void
	{
		this._nexts = [{step: _RemoveAllCablesConnectedToBox, params: []}];
		super.onClick();
	}
}