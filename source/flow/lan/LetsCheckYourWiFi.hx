package flow.lan;

import flow._AddMemoVti;
import flow.wifi.WifiOnInDashboard;
import tstool.process.Action;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class LetsCheckYourWiFi extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: WifiOnInDashboard, params: []}];
		super.onNoClick();
	}
}