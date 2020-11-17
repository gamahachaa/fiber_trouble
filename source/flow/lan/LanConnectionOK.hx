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
			/********************************************************************
			 * WiFi Not visible on Dashboard (all ready went though WiFi steps)
			/*******************************************************************/
			this._nextYesProcesses = [new _CreateTicketWifiIssue()];
		}
		else{
			
			if (Main.HISTORY.isInHistory("flow.all.customer.LanOrWiFi", Mid))
			{
				/*******************************************************************
				* BOTH issue 
				/******************************************************************/

				//this._nextYesProcesses = [new WifiOnInDashboard()];
				this._nextYesProcesses = [new LetsCheckYourWiFi()];
			}
			else{
				/*******************************************************************
				* LAN issue 
				/******************************************************************/
				this._nextYesProcesses = [new _AddMemoVti()];
			}
		}
		
		
		/*************************************************
		 * LAN NOK
		/*************************************************/
		
		this._nextNoProcesses = [new _SwapEthernetCable(), new _SwapEthernetPort()];
		
		
		
		if (!Main.HISTORY.isProcessInHistory("flow.lan.TestWithAppleTV") )
		{
			this._nextNoProcesses.push( new TestWithAppleTV() );
		}
		/*else if (!Main.HISTORY.isInHistory("flow.lan.TestWithAnotherLanDevice", Yes) || !Main.HISTORY.isInHistory("flow.lan.TestWithAnotherLanDevice", No))
		{
			this._nextNoProcesses.push( new _TestWithAnotherLanDevice() );
		}*/
		else if (!Main.HISTORY.isProcessInHistory("flow.all.fiberbox._LoopResetFiberBox"))
		{
			this._nextNoProcesses.push( new _LoopResetFiberBox() );
		}
		
		else if (Main.HISTORY.isProcessInHistory("flow.wifi.CanConnectToBoxWithLAN"))
		{
			/******************************************
			 * WiFi issue
			/*****************************************/
			this._nextNoProcesses.push( new _CreateTicketWifiIssue());
		}
		else{
			
			//this._nextNoProcesses.push( new _CreateTicketWifiIssue());
			this._nextNoProcesses.push( new OkToTryWifi());
		}
		
		super.create();
	}

}