package flow.tv.services;

import flow.tv.app._QuitAndRelaunchSaltTV;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsMessageInvitingToContactCC extends Descision 
{
	override public function create()
	{
		this._nextNoProcesses = [ new _QuitAndRelaunchSaltTV() ];
		this._nextYesProcesses = [ new IsTVServicesActiveVTI() ];
		super.create();
	}
}