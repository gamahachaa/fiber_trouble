package flow.collection;

import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _YouWillBeInformed extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
}