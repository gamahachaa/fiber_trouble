package flow.tv.remote.siri;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _GetCloseToAppleTV extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _PressMenuAndPlus, params: []}];
		super.onClick();
	}
}