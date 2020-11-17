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
	override public function create()
	{
		this._nextNoProcesses = [ new _QuitAndRelaunchSaltTV() ];
		this._nextYesProcesses = [ new IsTVServicesActiveVTI() ];
		this._nextMidProcesses = [ new HowConnected() ];
		super.create();
	}
}