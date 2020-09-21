package flow.tv.install;
import flow.tv._OpenSaltTVApp;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _CreateAppleIDorBypass extends Action
{
	override public function create()
	{
		this._nextProcesses = [new _OpenSaltTVApp()];
		super.create();
	}
}