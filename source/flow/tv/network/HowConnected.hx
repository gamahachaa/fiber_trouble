package flow.tv.network;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HowConnected extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: IsOtherWifiDeviceOK, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _EnsureLanCableWellPlugged, params: []}];
		super.onNoClick();
	}
}