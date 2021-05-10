package flow.collection;

import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class ForgotToPay extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _Pay, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsBillChallenged, params: []}];
		super.onNoClick();
	}
}