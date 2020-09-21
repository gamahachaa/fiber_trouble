package flow.tv.install;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CanSeeSaltTVOnAppleStore extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new HasAppleId()];
		this._nextYesProcesses = [ new _InstallSaltTV()];
		super.create();
	}
	
}