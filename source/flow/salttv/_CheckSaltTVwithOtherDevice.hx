package flow.salttv;

import process.Action;

/**
 * ...
 * @author bb
 */
class _CheckSaltTVwithOtherDevice extends Action 
{

	override public function create()
	{
		this._nextProcesses = [ new _ResetAppleTV()];
		super.create();
	}
	
}