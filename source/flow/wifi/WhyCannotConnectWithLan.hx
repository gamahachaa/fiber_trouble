package flow.wifi;

import flow.lan.ConnectedViaSwitch;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WhyCannotConnectWithLan extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _CreateTicketWifiIssue, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: ConnectedViaSwitch, params: []}];
		super.onNoClick();
	}
}