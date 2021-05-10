package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsStatusDelivered extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _GiveStatusAndRemindMyaccount, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _TellCustToGoToPost, params: []}];
		super.onNoClick();
	}
}