package flow.wifi;

import flow.lan.ConnectedViaSwitch;
import flow.tickets.CustomerInstruction;
import flow.wifi._CreateTicketWifiIssue;
//import tstool.process.Descision;
import tstool.process.Triplet;

/**
 * ...
 * @author ...
 */
class CanConnectToBoxWithLAN extends Triplet
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: ConnectedViaSwitch, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: WhyCannotConnectWithLan, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		//this._nexts = [{step: _CreateTicketWifiIssue, params: []}];
		this._nexts = [{step: CustomerInstruction, params: [{step: _CreateTicketWifiIssue},{step: _CreateTicketWifiIssue}]}];
		super.onMidClick();
	}
}