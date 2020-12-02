package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class VtiTrackParcelVisible extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: DidCustomerRecievedEmail, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _SoOrderLogisticsEquipment, params: []}];
		super.onNoClick();
	}
}