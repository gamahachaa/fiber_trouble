package flow.tv.remote.satltv;

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
		this._nexts = [{step: IsAppleTVFourthGen, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		trace("flow.tv.remote.satltv.DoesRedLedBlinksOnRemoteWhenPressed::onNoClick +++++++++");
		trace(Main.HISTORY.getClassIterations(DoesRedLedBlinksOnRemoteWhenPressed));
		this._nexts = [{step: _MakeSureBatteriesCoerrectlyInstalled},{step: CanReplaceBatteries},{step: WasThePurchaseDoneLessThanOnYearAgo}];
		super.onNoClick();
	}
}