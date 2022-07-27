package flow.tv.remote;

import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsAppleTVFourthGen extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: WichRemote, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsAppleTVvisibleOnTVScreen, params: []}];
		super.onNoClick();
	}
	
}