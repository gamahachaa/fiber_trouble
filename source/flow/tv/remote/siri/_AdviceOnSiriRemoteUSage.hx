package flow.tv.remote.siri;

import flow.tv.install.IsSaltIconVisibleOnAppleTV;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _AdviceOnSiriRemoteUSage extends Action 
{
	override public function create()
	{
		this._nextProcesses = [new IsSaltIconVisibleOnAppleTV()];
		super.create();
	}
}