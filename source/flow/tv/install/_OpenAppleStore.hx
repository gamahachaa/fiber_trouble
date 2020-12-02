package flow.tv.install;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _OpenAppleStore extends Action 
{
	
	override public function onClick():Void
	{
		this._nexts = [{step: CanSeeSaltTVOnAppleStore, params: []}];
		super.onClick();
	}
}