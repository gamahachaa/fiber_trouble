package flow.tv.remote.exttv;

import flow.tv.ChekSaltTVKNownBugs;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ClickOKOnRemote extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: ChekSaltTVKNownBugs, params: []}];
		super.onClick();
	}
}