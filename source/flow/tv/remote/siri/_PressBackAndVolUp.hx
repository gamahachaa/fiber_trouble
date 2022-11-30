package flow.tv.remote.siri;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _PressBackAndVolUp extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: DoesAppleTVLedBlinks, params: []}];
		super.onClick();
	}
	
}