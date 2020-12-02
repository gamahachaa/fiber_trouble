package flow.all.customer;

import flow._AddMemoVti;
import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _SendTechMail extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
}