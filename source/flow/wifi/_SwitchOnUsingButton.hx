package flow.wifi;

import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _SwitchOnUsingButton extends Action
{

	override public function onClick():Void
	{
		this._nexts = [{step: WifiOnInDashboard, params: []}];
		super.onClick();
	}
}