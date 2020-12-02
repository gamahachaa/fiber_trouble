package flow.tv.remote.siri;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _RechargeSiriRemote extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _GetCloseToAppleTV, params: []}];
		super.onClick();
	}
}