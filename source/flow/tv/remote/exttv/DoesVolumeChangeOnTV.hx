package flow.tv.remote.exttv;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class DoesVolumeChangeOnTV extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: ChekSaltTVKNownBugs, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: WantsToPairRemoteWithTV, params: []}];
		super.onNoClick();
	}
}