package flow.salttv;

import process.Descision;

/**
 * ...
 * @author bb
 */
class IsSaltIconVisibleOnAppleTV extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _InstallSaltTV()];
		this._nextYesProcesses = [ new IsMessageInvitingToContactCC()];
		super.create();
	}
}