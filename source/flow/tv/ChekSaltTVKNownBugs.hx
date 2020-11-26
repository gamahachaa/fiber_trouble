package flow.tv;

//import tstool.process.Action;
import flow.tv.app._QuitAndRelaunchSaltTV;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class ChekSaltTVKNownBugs extends Descision 
{

	override public function create()
	{
		//this._nextProcesses = [new _QuitAndRelaunchSaltTV()];
		this._nextYesProcesses = [new _InformSaltIsFixing()];
		this._nextNoProcesses = [new _QuitAndRelaunchSaltTV()];
		super.create();
	}
}