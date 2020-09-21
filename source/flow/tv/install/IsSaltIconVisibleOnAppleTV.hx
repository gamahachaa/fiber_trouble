package flow.tv.install;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsSaltIconVisibleOnAppleTV extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _OpenAppleStore()];
		this._nextYesProcesses = [ new _OpenSaltTVApp()];
		super.create();
	}
}