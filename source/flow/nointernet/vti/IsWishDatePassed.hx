package flow.nointernet.vti;

import flow._AddMemoVti;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsWishDatePassed extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _SoOrderNotComplete, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onNoClick();
	}
}