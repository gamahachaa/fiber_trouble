package flow.equipment;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ParcelIsBackToSalt extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _SoOrderLogisticsEquipment, params: []}];
		super.onClick();
	}
}