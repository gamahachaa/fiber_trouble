package flow.tv.sound;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _TryNewHDMICable extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _TryAnotherHDMIPort, params: []}];
		super.onClick();
	}
	
}