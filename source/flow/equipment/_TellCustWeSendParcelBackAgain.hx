package flow.equipment;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _TellCustWeSendParcelBackAgain extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: IsStatusDelivered, params: []}];
		super.onClick();
	}
}