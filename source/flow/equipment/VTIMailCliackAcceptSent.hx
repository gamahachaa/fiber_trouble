package flow.equipment;

import flow.nointernet.customer.HasCustomerLEXnetworkIssue;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class VTIMailCliackAcceptSent extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _SendParcelTrackingByEmail, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: HasCustomerEmailAddress, params: []}];
		super.onNoClick();
	}
}