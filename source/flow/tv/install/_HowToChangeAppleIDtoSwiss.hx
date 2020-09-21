package flow.tv.install;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _HowToChangeAppleIDtoSwiss extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new _InstallSaltTV()];
		super.create();
	}
	
}