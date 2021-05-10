package flow.tv.remote.siri;

import flow.tv.install.IsSaltIconVisibleOnAppleTV;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _AdviceOnSiriRemoteUSage extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: IsSaltIconVisibleOnAppleTV, params: []}];
		super.onClick();
	}
}