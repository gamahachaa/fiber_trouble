package flow.ftth.canceled;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _PomCanceledOrOfferClosed extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: IsOderPossibleInVTI, params: []}];
		super.onClick();
	}
	
}