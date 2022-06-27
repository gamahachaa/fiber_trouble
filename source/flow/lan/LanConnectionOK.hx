package flow.lan;

import flow.all.fiberbox._LoopResetFiberBox;
import flow._AddMemoVti;
//import flow.lan._CreateLanIssueTicket;
//import flow.nointernet.so._CreateTicketModemCNX;
import flow.tickets.CustomerInstruction;
//import flow.wifi.WifiOnInDashboard;
import flow.wifi._CreateTicketWifiIssue;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author ...
 */
class LanConnectionOK extends Descision
{
	override public function onYesClick():Void
	{
		//var next:Class<Process> = if (
		#if debug
			trace("flow.lan.LanConnectionOK::onYesClick 1");
		#end
		var next:ProcessContructor = if (
						Main.HISTORY.isClassInteractionInHistory(flow.wifi.CanConnectToBoxWithLAN, Yes) || Main.HISTORY.isClassInteractionInHistory(flow.wifi.CanConnectToBoxWithLAN, No) 
						&& Main.HISTORY.isClassInteractionInHistory(flow.all.customer.LanOrWiFi, Yes))
		{
			/********************************************************************
			 * WiFi Not visible on Dashboard (all ready went though WiFi steps)
			/*******************************************************************/
			//_CreateTicketWifiIssue;
			#if debug
				trace("flow.lan.LanConnectionOK::onYesClick 2");
			#end
			{step: CustomerInstruction, params: [{step: _CreateTicketWifiIssue},{step: _CreateTicketWifiIssue}]};
		}
		else{
			
			#if debug
				trace("flow.lan.LanConnectionOK::onYesClick 3");
			#end
			if (Main.HISTORY.isClassInteractionInHistory(flow.all.customer.LanOrWiFi, Mid))
			{
				/*******************************************************************
				* BOTH issue 
				/******************************************************************/
				//LetsCheckYourWiFi;
				#if debug
					trace("flow.lan.LanConnectionOK::onYesClick 4 ");
				#end
				//{step: _CreateTicketWifiIssue};
				{step: CustomerInstruction, params: [{step: _CreateTicketWifiIssue},{step: _CreateTicketWifiIssue}]}
			}
			else{
				/*******************************************************************
				* LAN issue 
				/******************************************************************/
				//_AddMemoVti;
				#if debug
					trace("flow.lan.LanConnectionOK::onYesClick 5");
				#end
				{step: _AddMemoVti};
			}
		}
		//this._nexts = [{step: next, params: []}];
		this._nexts = [next];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		if (!Main.HISTORY.isClassInHistory(flow.lan.TestWithAppleTV) )
		{
			this._nexts.push( {step: TestWithAppleTV} );
		}
		else if (!Main.HISTORY.isClassInHistory(flow.all.fiberbox._LoopResetFiberBox))
		{
			this._nexts.push( {step: _LoopResetFiberBox} );
		}
		
		else if (Main.HISTORY.isClassInHistory(flow.wifi.CanConnectToBoxWithLAN))
		{
			/******************************************
			 * WiFi issue
			/*****************************************/
			//this._nexts.push( {step: _CreateTicketWifiIssue});
			this._nexts.push( {step: CustomerInstruction, params: [{step: _CreateTicketWifiIssue},{step: _CreateTicketWifiIssue}]});
		}
		else{
			this._nexts.push( {step: OkToTryWifi});
		}
		super.onNoClick();
	}
}