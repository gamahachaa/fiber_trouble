package flow.wifi;

import flow.lan.ConnectedViaSwitch;
import flow.tickets.CustomerInstruction;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WhyCannotConnectWithLan extends Descision 
{
	override public function onYesClick():Void
	{
		//this._nexts = [{step: _CreateTicketWifiIssue, params: []}];
		this._nexts = [{step: CustomerInstruction, params: [{step: _CreateTicketWifiIssue},{step: _CreateTicketWifiIssue}]}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: ConnectedViaSwitch, params: []}];
		super.onNoClick();
	}
}