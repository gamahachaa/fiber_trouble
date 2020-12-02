package flow.tv.remote.exttv;

import flow.tv.ChekSaltTVKNownBugs;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WantsToPairRemoteWithTV extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _PressMenuAndOK, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: ChekSaltTVKNownBugs, params: []}];
		super.onNoClick();
	}
}