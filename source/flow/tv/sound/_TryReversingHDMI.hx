package flow.tv.sound;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _TryReversingHDMI extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _TryNewHDMICable, params: []}];
		super.onClick();
	}
}