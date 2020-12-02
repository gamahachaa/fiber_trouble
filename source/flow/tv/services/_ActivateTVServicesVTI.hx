package flow.tv.services;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ActivateTVServicesVTI extends Action 
{
	
	override public function onClick():Void
	{
		this._nexts = [{step: IsSaltTVWorkingNow, params: []}];
		super.onClick();
	}
}