package flow.tv.remote.satltv;

import flow.tv.hardware._UnplugAppleTVPowerCable;
import flow.tv.remote.repair.WasThePurchaseDoneLessThanOnYearAgo;
import flow.tv.remote.salttvv2._PressVolAndMenuTenSec;
import flow.tv.remote.satltv.CanReplaceBatteries;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class DoesRedLedBlinksOnRemoteWhenPressed extends Descision
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: DoesAppleTVLedBlinks, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		//var remote = Main.HISTORY.findValueOfFirstClassInHistory( WichRemote, WichRemote.REMOTE_VERSION).value;	//trace("flow.tv.remote.satltv.DoesRedLedBlinksOnRemoteWhenPressed::onNoClick +++++++++");
		//trace(Main.HISTORY.getClassIterations(DoesRedLedBlinksOnRemoteWhenPressed));
		this._nexts = [
						{step:CanReplaceBatteries},
						{step: WasThePurchaseDoneLessThanOnYearAgo}
					]; 
			
		super.onNoClick();
	}
}