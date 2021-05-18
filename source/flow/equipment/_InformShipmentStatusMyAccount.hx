package flow.equipment;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _InformShipmentStatusMyAccount extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: IsStatusReturned, params: []}];
		super.onClick();
	}
}