package flow.tv.remote.satltv;

import flow._AddMemoVti;
import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ReplaceBatteriesThenCallUsBack extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: IsAppleTVvisibleOnTVScreen, params: []}];
		super.onClick();
	}
}