package flow.ftth.delegate;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _InformCustOrderOnHold extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: CanGiveOTOid, params: []}];
		super.onClick();
	}
	
}