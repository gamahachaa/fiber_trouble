package flow.lan;

import flow.all.fiberbox._LoopResetFiberBox;
import flow._AddMemoVti;
import flow.lan._CreateLanIssueTicket;
import flow.nointernet.so._CreateTicketModemCNX;
import flow.wifi.WifiOnInDashboard;
import flow.wifi._CreateTicketWifiIssue;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author ...
 */
class LanConnectionOK extends Descision
{

	override public function create():Void
	{
		/*************************************************
		 * LAN OK
		/*************************************************/
		if (Main.HISTORY.isInHistory("flow.wifi.CanConnectToBoxWithLAN", Yes) || Main.HISTORY.isInHistory("flow.wifi.CanConnectToBoxWithLAN", No) && Main.HISTORY.isInHistory("flow.all.customer.LanOrWiFi", Yes))
		{
			/************************************
			 * WiFi Not visible on Dashboard
			/***********************************/
			this._nextYesProcesses = [new _CreateTicketWifiIssue()];
		}
		else{
			/********************************
			 * LAN issue
			/********************************/
			this._nextYesProcesses = [new _AddMemoVti()];
		}
		
		
		/*************************************************
		 * LAN NOK
		/*************************************************/
		
		this._nextNoProcesses = [new _SwapEthernetCable(), new _SwapEthernetPort()];
		
		
		if (Main.HISTORY.isInHistory("flow.lan.TestWithAppleTV", Next) && !Main.HISTORY.isInHistory("flow.lan.TestWithAnotherLanDevice", Next))
		{
			this._nextNoProcesses.push( new _TestWithAnotherLanDevice() );
		}
		else if(!Main.HISTORY.isInHistory("flow.lan.TestWithAppleTV", Next))
			this._nextNoProcesses.push( new TestWithAppleTV() );
		
		
		if (!Main.HISTORY.isInHistory("flow.all.fiberbox._LoopResetFiberBox", Next))
		{
			this._nextNoProcesses.push( new _LoopResetFiberBox() );
		}
		
		if (Main.HISTORY.isInHistory("flow.wifi.CanConnectToBoxWithLAN", Yes) || Main.HISTORY.isInHistory("flow.wifi.CanConnectToBoxWithLAN", No) && Main.HISTORY.isInHistory("flow.all.customer.LanOrWiFi", Yes))
		{
			/******************************************
			 * WiFi Not visible on Dashboard WiFi issue
			/*****************************************/
			this._nextNoProcesses.push( new _CreateTicketWifiIssue());
		}
		else if (Main.HISTORY.isInHistory("flow.wifi.CanConnectToBoxWithLAN", Yes) || Main.HISTORY.isInHistory("flow.wifi.CanConnectToBoxWithLAN", No) && !Main.HISTORY.isInHistory("flow.all.customer.LanOrWiFi", Yes))
		{
			/*******************************************
			 * Lan issue or Both and WiFi tested
			/*******************************************/
			this._nextNoProcesses.push( new _CreateTicketModemCNX());
		}
		else{
			
			//this._nextNoProcesses.push( new _CreateTicketWifiIssue());
			this._nextNoProcesses.push( new OkToTryWifi());
		}
		/*
		if (Main.HISTORY.isInHistory("flow.all.fiberbox._LoopResetFiberBox", Next))
		{
			//this._nextNoProcesses = [new _CreateLanIssueTicket()];
				this._nextNoProcesses = [new WifiOnInDashboard()];
		}
		else
			this._nextYesProcesses = [new _AddMemoVti()];
		//this._nextNoProcesses = [new _CreateLanIssueTicket()];

		if (Main.HISTORY.isInHistory("flow.lan.TestWithAppleTV", Yes) && !Main.HISTORY.isInHistory("flow.lan.TestWithAnotherLanDevice", Next))
		{
			this._nextNoProcesses = [new _TestWithAnotherLanDevice()];
		}
		else if (Main.HISTORY.isInHistory("flow.lan.TestWithAnotherLanDevice", Next))
		{
			if (Main.HISTORY.isInHistory("flow.wifi.WhyCannotConnectWithLan", No))
			{
				// came from WiFi Issue
				this._nextNoProcesses = [new _CreateTicketWifiIssue()];
			}
			else if (Main.HISTORY.isInHistory("flow.all.fiberbox._LoopResetFiberBox", Next))
			{
				//this._nextNoProcesses = [new _CreateLanIssueTicket()];
				this._nextNoProcesses = [new WifiOnInDashboard()];
			}
			else
				this._nextNoProcesses = [new _LoopResetFiberBox()];
		}
		else
			this._nextNoProcesses = [new _SwapEthernetCable(), new _SwapEthernetPort(), new TestWithAppleTV()];
			*/
		super.create();
	}

}