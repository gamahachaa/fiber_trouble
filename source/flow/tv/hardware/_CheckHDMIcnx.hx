package flow.tv.hardware;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _CheckHDMIcnx extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: IsAppleTVvisibleOnTVScreen, params: []}];
		super.onClick();
	}
}