package flow.tv.hardware;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _MakeSurePowerCableWellPlugged extends Action 
{
	
	override public function onClick():Void
	{
		this._nexts = [{step: WhiteLightLids, params: []}];
		super.onClick();
	}
}