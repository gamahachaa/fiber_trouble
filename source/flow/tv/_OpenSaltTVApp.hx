package flow.tv;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _OpenSaltTVApp extends Action 
{

	override public function create()
	{
		//this._nextProcesses = [new IsMessageInvitingToContactCC()];
		this._nextProcesses = [new CanExploreMenu()];
		super.create();
	}
	
}