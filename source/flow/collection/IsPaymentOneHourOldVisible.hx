package flow.collection;

import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class IsPaymentOneHourOldVisible extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: ManuallyUnblock, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _InformUsualPaymentDelays, params: []}];
		super.onNoClick();
	}
}