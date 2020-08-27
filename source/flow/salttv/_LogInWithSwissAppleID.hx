package flow.salttv;

import tstool.process.Action;

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