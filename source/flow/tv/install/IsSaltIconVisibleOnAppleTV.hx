package flow.tv.install;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsSaltIconVisibleOnAppleTV extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _OpenSaltTVApp, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _OpenAppleStore, params: []}];
		super.onNoClick();
	}
}