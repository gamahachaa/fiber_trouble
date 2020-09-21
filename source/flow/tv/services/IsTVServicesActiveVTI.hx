package flow.tv.services;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsTVServicesActiveVTI extends Descision
{

	override public function create()
	{
		this._nextNoProcesses = [ new _ActivateTVServicesVTI()];
		//this._nextYesProcesses = [ new _InstallSpeedTestAplleTV() ];
		this._nextYesProcesses = [ new _QuitAndRelaunchSaltTV() ];
		super.create();
	}
	
}