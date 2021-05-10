package flow.collection;

import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class MoreThanFiveDaysAgo extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _PaymentSearch, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsPaymentOneHourOldVisible, params: []}];
		super.onNoClick();
	}
}