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

	override public function create()
	{
		this._nextNoProcesses = [new IsMessageInvitingToContactCC(), new _QuitAndRelaunchSaltTV()];
		this._nextYesProcesses = [new WhatIssueWithApp()];
		super.create();
	}
}