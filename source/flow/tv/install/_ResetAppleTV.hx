package flow.tv.install;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ResetAppleTV extends Action
{
	
	override public function onClick():Void
	{
		this._nexts = [{step: _CreateAppleIDorBypass, params: []}];
		super.onClick();
	}
}