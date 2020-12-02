package flow.lan;

import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _RemoveAllCablesConnectedToBox extends Action
{

	
	override public function onClick():Void
	{
		this._nexts = [{step: LanConnectionOK, params: []}];
		super.onClick();
	}
}