package flow.tv.sound;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _MakeSureHDMIWellConnected extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: HaveHDMISwitch, params: []}];
		super.onClick();
	}
	
}