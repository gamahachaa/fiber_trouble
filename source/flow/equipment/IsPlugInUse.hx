package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsPlugInUse extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: DidCustomerSendProffCancel, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsWhishDateWayAhead, params: []}];
		super.onNoClick();
	}
}