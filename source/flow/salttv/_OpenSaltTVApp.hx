package flow.salttv;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _OpenSaltTVApp extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new IsMessageInvitingToContactCC()];
		super.create();
	}
	
}