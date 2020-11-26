package flow.tv.services;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ActivateTVServicesVTI extends Action 
{
	override public function create()
	{
		this._nextProcesses = [new IsSaltTVWorkingNow()];
		super.create();
	}
}