package flow.equipment;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _SendParcelTrackingByEmail extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _InformShipmentStatusMyAccount, params: []}];
		super.onClick();
	}
}