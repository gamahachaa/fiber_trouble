package flow.ftth.delegate;

import flow._AddMemoVti;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HasAccessToMyAccount extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _UpdateSOTicketWithOTO, params: []}];
		super.onNoClick();
	}
}