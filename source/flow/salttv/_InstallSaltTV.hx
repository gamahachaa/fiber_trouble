package flow.salttv;

import process.Action;

/**
 * ...
 * @author bb
 */
class _InstallSaltTV extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new HasAppleAccount()];
		super.create();
	}
	
}