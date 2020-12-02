package flow.nointernet.vti;


//import flow.powercable.LedPowerOn;
import flow.nointernet.customer.HasCustomerLEXnetworkIssue;
import tstool.process.Descision;

/**
 * @FROMHERE
 * ...
 * @author ...
 */
class ActivationDone extends Descision
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: HasCustomerLEXnetworkIssue, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsWishDatePassed, params: []}];
		super.onNoClick();
	}
}