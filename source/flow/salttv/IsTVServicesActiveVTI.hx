package flow.salttv;
import process.Descision;

/**
 * ...
 * @author bb
 */
class IsTVServicesActiveVTI extends Descision
{

	override public function create()
	{
		this._nextNoProcesses = [ new _ActivateTVServicesVTI()];
		this._nextYesProcesses = [ new _InstallSpeedTestAplleTV() ];
		super.create();
	}
	
}