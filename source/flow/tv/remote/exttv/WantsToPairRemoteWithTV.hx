package flow.tv.remote.exttv;

import flow.tv.ChekSaltTVKNownBugs;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WantsToPairRemoteWithTV extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new ChekSaltTVKNownBugs()];
		this._nextYesProcesses = [new _PressMenuAndOK()];
		super.create();
	}
	
}