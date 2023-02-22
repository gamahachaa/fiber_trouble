package flow.ftth.status;

import flow.equipment._OpenPostParcelTracking;
import flow.equipment._SoOrderLogisticsEquipment;
import tstool.process.Descision;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class _CPESendingOngoingOrange extends Triplet 
{
	override public function onYesClick():Void
	{
		//Orange
		this._nexts = [{step: _InformAboutDelivery, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		// Black
		this._nexts = [{step: _SoOrderLogisticsEquipment, params: []}];
		super.onNoClick();
	}
	override public function onMidClick():Void
	{
		//Green
		this._nexts = [{step: _OpenPostParcelTracking, params: []}];
		super.onMidClick();
	}
}