package flow.tv.remote.exttv;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _PressMenuAndOK extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _AimAtTVAndClick, params: []}];
		super.onClick();
	}
}