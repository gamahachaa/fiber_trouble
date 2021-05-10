package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HasCustomerEmailAddress extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _ResendValidationEmail, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _SendParcelTrackingBySMS, params: []}];
		super.onNoClick();
	}
}