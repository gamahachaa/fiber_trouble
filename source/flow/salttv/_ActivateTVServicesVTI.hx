package flow.salttv;
import process.Action;

/**
 * ...
 * @author bb
 */
class _ActivateTVServicesVTI extends Action
{

	override public function create()
	{
		this._nextProcesses = [ new _OpenSaltTVApp() ];
		super.create();
	}
	
}