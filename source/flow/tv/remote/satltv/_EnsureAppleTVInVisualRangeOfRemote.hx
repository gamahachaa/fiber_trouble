package flow.tv.remote.satltv;

import tstool.process.Action;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class _EnsureAppleTVInVisualRangeOfRemote extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: DoesRedLedBlinksOnRemoteWhenPressed, params: []}];
		super.onClick();
	}
}