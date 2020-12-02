package flow.tv;

import flow.tv.app._QuitAndRelaunchSaltTV;
import flow.tv.services.IsMessageInvitingToContactCC;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CanExploreMenu extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: ChekSaltTVKNownBugs, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsMessageInvitingToContactCC}, {step: _QuitAndRelaunchSaltTV}];
		super.onNoClick();
	}
}