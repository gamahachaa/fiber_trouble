package flow.tv.install;

import flow.tv._OpenSaltTVApp;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _InstallSaltTV extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _OpenSaltTVApp, params: []}];
		super.onClick();
	}
}