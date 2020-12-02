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
}