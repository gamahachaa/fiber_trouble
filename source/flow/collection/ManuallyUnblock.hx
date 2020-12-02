package flow.collection;

import flow._AddMemoVti;
import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class ManuallyUnblock extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
}