package flow.tv.remote.repair;

import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _NeedToBuyOneNew extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
}