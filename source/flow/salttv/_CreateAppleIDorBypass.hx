package flow.salttv;
import process.Action;

/**
 * ...
 * @author bb
 */
class _CreateAppleIDorBypass extends Action
{
	override public function create()
	{
		this._nextProcesses = [new IsSaltIconVisibleOnAppleTV()];
		super.create();
	}
}