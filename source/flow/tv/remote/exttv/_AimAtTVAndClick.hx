package flow.tv.remote.exttv;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _AimAtTVAndClick extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: MenuVoluemDisplaysOnTV, params: []}];
		super.onClick();
	}
}