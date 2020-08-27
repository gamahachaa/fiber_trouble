package flow.wifi;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _MoveCloseUnplugRepeater extends Action
{

	override public function create()
	{
		this._nextProcesses = [new WifiVisibleByAppleTV()];
		super.create();
	}
	
}