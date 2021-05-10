package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class DidCustomerRecievedEmail extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _InformShipmentStatusMyAccount, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: VTIMailCliackAcceptSent, params: []}];
		super.onNoClick();
	}
}