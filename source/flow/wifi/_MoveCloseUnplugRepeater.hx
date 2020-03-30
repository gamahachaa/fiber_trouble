package flow.wifi;
import process.Action;

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