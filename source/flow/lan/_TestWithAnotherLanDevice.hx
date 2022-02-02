package flow.lan;

import flow.tickets.CustomerInstruction;
import flow.wifi._CreateTicketWifiIssue;
import tstool.process.Action;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class _TestWithAnotherLanDevice extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: LanConnectionOK, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		//var next:Class<Process> = if (Main.HISTORY.isClassInteractionInHistory(flow.wifi.CanConnectToBoxWithLAN, Yes) || Main.HISTORY.isClassInteractionInHistory(flow.wifi.CanConnectToBoxWithLAN, No) && Main.HISTORY.isClassInteractionInHistory(flow.all.customer.LanOrWiFi, Yes))
		//{
			//
			///******************************************
			 //* WiFi Not visible on Dashboard WiFi issue
			///*****************************************/
			//_CreateTicketWifiIssue;
		//}
		//else
			//OkToTryWifi;
			var next:ProcessContructor = if (Main.HISTORY.isClassInteractionInHistory(flow.wifi.CanConnectToBoxWithLAN, Yes) || Main.HISTORY.isClassInteractionInHistory(flow.wifi.CanConnectToBoxWithLAN, No) && Main.HISTORY.isClassInteractionInHistory(flow.all.customer.LanOrWiFi, Yes))
		{
			
			/******************************************
			 * WiFi Not visible on Dashboard WiFi issue
			/*****************************************/
			//_CreateTicketWifiIssue;
			{step: CustomerInstruction, params: [{step: _CreateTicketWifiIssue},{step: _CreateTicketWifiIssue}]};
		}
		else
			{step: OkToTryWifi};
			//OkToTryWifi;
			//{step: CustomerInstruction, params: [{step: _CreateTicketWifiIssue},{step: _CreateTicketWifiIssue}]}
		this._nexts = [next];
		super.onNoClick();
	}
}