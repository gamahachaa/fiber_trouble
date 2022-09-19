package flow.nointernet.customer;

import flow._AddMemoVti;
//import flow.nointernet.so.IsTicketOpened;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HasCustomerLEXnetworkIssue extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: FiberCableChanged, params: []}];
		super.onNoClick();
	}
}