package flow.tv.remote.satltv;

import flow.salttv._OpenSaltTVApp;
import flow.tv.remote.satltv._SteupSaltTVRemoteWithRegularTV;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class AreIconsMovingOnScreenWhenNavigating extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _OpenSaltTVApp, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _SteupSaltTVRemoteWithRegularTV, params: []}];
		super.onNoClick();
	}
}