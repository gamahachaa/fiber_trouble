package flow.tv.install;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ResetAppleTV extends Action
{
	override public function create()
	{
		this._nextProcesses = [new _CreateAppleIDorBypass() ];
		super.create();
	}
}