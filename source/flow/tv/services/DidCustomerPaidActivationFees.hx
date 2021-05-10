package flow.tv.services;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class DidCustomerPaidActivationFees extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _ChangeBasicPackage, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: DoesWantTVNow, params: []}];
		super.onNoClick();
	}
}