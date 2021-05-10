package flow.tv.services;

import flow.tv.app._QuitAndRelaunchSaltTV;
import flow.tv.network.HowConnected;
//import tstool.process.Descision;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class IsMessageInvitingToContactCC extends Triplet 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: IsTVServicesActiveVTI, params: []}];
		super.onYesClick();
	}	
	override public function onNoClick():Void
	{
		this._nexts = [{step: _QuitAndRelaunchSaltTV, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: HowConnected, params: []}];
		super.onMidClick();
	}
}