package flow.salttv;

import process.Action;

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