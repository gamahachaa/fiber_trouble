package flow.salttv;
import tstool.process.Action;

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