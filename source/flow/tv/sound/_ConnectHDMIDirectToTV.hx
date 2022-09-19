package flow.tv.sound;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ConnectHDMIDirectToTV extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _TryReversingHDMI, params: []}];
		super.onClick();
	}
	
}