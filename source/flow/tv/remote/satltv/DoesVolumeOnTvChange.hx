package flow.tv.remote.satltv;

import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class DoesVolumeOnTvChange extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: IsAppleTVvisibleOnTVScreen, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: WasThePurchaseDoneLessThanOnYearAgo, params: []}];
		super.onNoClick();
	}
}