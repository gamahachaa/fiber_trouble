package flow.salttv;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsSaltIconVisibleOnAppleTV extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new HasAppleAccount()];
		this._nextYesProcesses = [ new _OpenSaltTVApp()];
		super.create();
	}
}