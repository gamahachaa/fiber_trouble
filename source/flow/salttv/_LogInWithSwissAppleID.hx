package flow.salttv;

import process.Action;

/**
 * ...
 * @author bb
 */
class _LogInWithSwissAppleID extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new _InstallSaltTV()];
		super.create();
	}
	
}