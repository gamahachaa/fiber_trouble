package flow.tv.install;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CanCreateAppleAccount extends Descision 
{
	override public function create()
	{
		this._nextNoProcesses = [new _ResetAppleTV()];
		this._nextYesProcesses = [new _LogInWithSwissAppleID()];
		super.create();
	}
}