package flow.collection;

import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class PayedAlready extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: MoreThanFiveDaysAgo, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: ForgotToPay, params: []}];
		super.onNoClick();
	}
}