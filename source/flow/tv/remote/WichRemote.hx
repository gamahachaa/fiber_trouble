package flow.tv.remote;


import flow.tv.remote.salttvv2.CanPair;
import flow.tv.remote.satltv._EnsureAppleTVInVisualRangeOfRemote;
import tstool.process.Triplet;
//import flow.tv.remote.siri.DoesLightningDiodeLids;
import flow.tv.remote.siri._AdviceOnSiriRemoteUSage;
import flow.tv.remote.siri._RechargeSiriRemote;
//import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WichRemote extends Triplet 
{
	
	override public function onYesClick():Void
	{
		this._nexts = [{
			step: DoesAppleTVLedBlinks,
			params: [
				{step: _AdviceOnSiriRemoteUSage},
				{step: _RechargeSiriRemote}]
		}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _EnsureAppleTVInVisualRangeOfRemote}];
		super.onNoClick();
	}
	override public function onMidClick():Void
	{
		this._nexts = [{step: CanPair}];
		super.onNoClick();
	}
}