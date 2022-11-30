package flow.phone;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsTheDeviceWorking extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: HowIsDeviceConnected, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: PurchaseANewPhone, params: []}];
		super.onNoClick();
	}
	
}