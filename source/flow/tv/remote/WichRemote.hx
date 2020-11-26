package flow.tv.remote;


import flow.tv.remote.satltv._EnsureAppleTVInVisualRangeOfRemote;
//import flow.tv.remote.siri.DoesLightningDiodeLids;
import flow.tv.remote.siri._AdviceOnSiriRemoteUSage;
import flow.tv.remote.siri._RechargeSiriRemote;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WichRemote extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _EnsureAppleTVInVisualRangeOfRemote()];
		//this._nextYesProcesses = [new DoesLightningDiodeLids()];
		this._nextYesProcesses = [new DoesAppleTVLedBlinks(new _AdviceOnSiriRemoteUSage(), new _RechargeSiriRemote())];
		super.create();
	}
}