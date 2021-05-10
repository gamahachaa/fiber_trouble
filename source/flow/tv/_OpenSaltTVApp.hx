package flow.tv;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _OpenSaltTVApp extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: CanExploreMenu, params: []}];
		super.onClick();
	}
}