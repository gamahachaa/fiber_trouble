package flow.tv.sound;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _TryAnotherHDMIPort extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _TryAnotherTV, params: []}];
		super.onClick();
	}
}