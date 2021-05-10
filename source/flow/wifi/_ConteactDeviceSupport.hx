package flow.wifi;

import flow.Intro;
import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _ConteactDeviceSupport extends Action
{
	override public function onClick():Void
	{
		this._nexts = [{step: End, params: []}];
		super.onClick();
	}
}