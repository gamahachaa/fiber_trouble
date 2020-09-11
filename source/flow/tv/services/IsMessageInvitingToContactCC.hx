package flow.salttv;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsMessageInvitingToContactCC extends Descision 
{
	override public function create()
	{
		this._nextNoProcesses = [ new IsImageJerky() ];
		//this._nextNoProcesses = [ new HowWithOtherDevice()];
		//this._nextYesProcesses = [ new _ResetAppleTV()];
		this._nextYesProcesses = [ new IsTVServicesActiveVTI(), new _QuitAndRelaunchSaltTV() ];
		super.create();
	}
}