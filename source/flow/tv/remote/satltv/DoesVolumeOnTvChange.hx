package flow.tv.remote.satltv;

import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import flow.tv.remote.exttv.WantsToPairRemoteWithTV;
import flow.tv.remote.repair.WasThePurchaseDoneLessThanOnYearAgo;
import flow.tv.remote.salttvv2.IsIssueWithGuide;
import flow.tv.remote.siri._GetCloseToAppleTV;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class DoesVolumeOnTvChange extends Descision 
{
	//var remote:String;
	override public function onYesClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		//this._nexts = [{step: WantsToPairRemoteWithTV, params: []}];
		this._nexts = switch (Main.HISTORY.findValueOfFirstClassInHistory( WichRemote, WichRemote.REMOTE_VERSION).value){
			case WichRemote.SALT_V2 : [{step: IsIssueWithGuide, params: []}];
			case WichRemote.SALT_V1 : [{step: WantsToPairRemoteWithTV, params: []}]; //volume
			case _ : [{step: _GetCloseToAppleTV, params: []}];
		}
		super.onNoClick();
	}
}