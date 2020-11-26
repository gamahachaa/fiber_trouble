package flow.tv;

import flow.tv.app._QuitAndRelaunchSaltTV;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WhatIssueWithApp extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _QuitAndRelaunchSaltTV()];
		this._nextYesProcesses = [new ChekSaltTVKNownBugs()];
		super.create();
	}
	
}