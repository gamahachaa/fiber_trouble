package flow.collection;

import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _Pay extends Action
{
	override public function onClick():Void
	{
		this._nexts = [{step: _InformUsualPaymentDelays, params: []}];
		super.onClick();
	}
}