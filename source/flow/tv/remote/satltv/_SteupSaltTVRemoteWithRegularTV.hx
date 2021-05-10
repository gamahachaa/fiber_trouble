package flow.tv.remote.satltv;

import flow.tv.remote.satltv.DoesVolumeOnTvChange;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _SteupSaltTVRemoteWithRegularTV extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: DoesVolumeOnTvChange, params: []}];
		super.onClick();
	}
}