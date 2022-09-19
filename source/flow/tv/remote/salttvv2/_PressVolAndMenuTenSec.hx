package flow.tv.remote.salttvv2;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _PressVolAndMenuTenSec extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: DoesAppleTVLedBlinks, params: []}];
		super.onClick();
	}
	
}