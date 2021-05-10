package flow.tv.services;

import flow._AddMemoVti;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ChangeBasicPackage extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
}