package flow.tv.remote;

import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import flow.tv.hardware._RepairProcess;
import flow.tv.hardware._UnplugAppleTVPowerCable;
import flow.tv.remote.repair.WasThePurchaseDoneLessThanOnYearAgo;
import flow.tv.remote.salttvv2.IsIssueWithGuide;
import flow.tv.remote.salttvv2._PressVolAndMenuTenSec;
import flow.tv.remote.satltv.CanReplaceBatteries;
import flow.tv.remote.satltv.DoesVolumeOnTvChange;
import flow.tv.remote.satltv._MakeSureBatteriesCoerrectlyInstalled;
import flow.tv.remote.siri._GetCloseToAppleTV;
import flow.tv.remote.siri._RechargeSiriRemote;
import flow.tv.sound.volume.VolumeButtonDoesWork;
import tstool.process.Descision;
//import tstool.process.Descision;
//import tstool.process.DescisionLoop;

/**
 * ...
 * @author bb
 */
//class DoesAppleTVLedBlinks extends DescisionLoop{
class DoesAppleTVLedBlinks extends Descision{
	var remote:String;
	override public function create():Void 
	{
		remote = Main.HISTORY.findValueOfFirstClassInHistory( WichRemote, WichRemote.REMOTE_VERSION).value;
		super.create();
	}
	override public function onYesClick():Void
	{
		
		this._nexts = switch (remote){
			case WichRemote.SALT_V2 : [{step: IsIssueWithGuide, params: []}];
			case WichRemote.SALT_V1 : [{step: DoesVolumeOnTvChange, params: []}]; //volume
			case WichRemote.SIRI_V2 : [{step: _CreateSOTicketSaltTV, params: []}];
			case _ : [{step: VolumeButtonDoesWork, params: []}];
		}
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = switch (remote){
			case WichRemote.SALT_V2 :[
				{step: _MakeSureBatteriesCoerrectlyInstalled},
				{step: WasThePurchaseDoneLessThanOnYearAgo}
			];
			case WichRemote.SALT_V1 :[
				{step: WasThePurchaseDoneLessThanOnYearAgo}
			];
			case _ : [
				{step: _UnplugAppleTVPowerCable},
				{step: _RechargeSiriRemote}
			];
		};
		super.onNoClick();
	}
}