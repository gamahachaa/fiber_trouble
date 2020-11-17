package flow.tv.remote.exttv;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class DoesVolumeChangeOnTV extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new WantsToPairRemoteWithTV()];
		this._nextYesProcesses = [ new ChekSaltTVKNownBugs()];
		super.create();
	}
}