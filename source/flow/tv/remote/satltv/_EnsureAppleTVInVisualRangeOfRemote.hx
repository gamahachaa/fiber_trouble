package flow.tv.remote.satltv;

import tstool.process.Action;
//import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class _EnsureAppleTVInVisualRangeOfRemote extends Action 
{
	override public function onClick():Void
	{
		//trace("flow.tv.remote.satltv._EnsureAppleTVInVisualRangeOfRemote::onClick----------------------------------------------------");
		//this._nexts = [{step: DoesRedLedBlinksOnRemoteWhenPressed, params: []}];
		this._nexts = [{step: _MakeSureBatteriesCoerrectlyInstalled, params: []}];
		super.onClick();
	}
}