package flow.stability.atf;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _TestAgain extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
	
}