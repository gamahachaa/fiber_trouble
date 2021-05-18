package flow.ftth.status;

import flow.equipment.DidCustomerRecievedEmail;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _InformAboutDelivery extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: DidCustomerRecievedEmail, params: []}];
		super.onClick();
	}
	
}