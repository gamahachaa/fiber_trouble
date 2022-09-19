package flow.tv.remote.repair;

import flow.tv.remote.repair._GoToStoreToReplace;
import flow.tv.remote.repair._NeedToBuyOneNew;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WasThePurchaseDoneLessThanOnYearAgo extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _NeedToBuyOneNew, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _GoToStoreToReplace, params: []}];
		super.onNoClick();
	}
}