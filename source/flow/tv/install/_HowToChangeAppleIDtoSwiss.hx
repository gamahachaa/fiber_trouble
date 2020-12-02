package flow.tv.install;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _HowToChangeAppleIDtoSwiss extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _InstallSaltTV, params: []}];
		super.onClick();
	}
}