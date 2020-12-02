package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WasParcelInRothenbug extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: IsVTILaposteSendBoxMsgVisible, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsStatusDelivered, params: []}];
		super.onNoClick();
	}
}