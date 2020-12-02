package flow.tv.remote.exttv;

import flow.tv.ChekSaltTVKNownBugs;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class MenuVoluemDisplaysOnTV extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _ClickOKOnRemote, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _PressMenuAndOK},{step: ChekSaltTVKNownBugs}];
		super.onNoClick();
	}
}