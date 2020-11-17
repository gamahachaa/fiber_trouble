package flow.nointernet.so;

import flow.equipment.IsWhishDateWayAhead;
import flow.escalation.IsTechTicket;
import flow.nointernet.fiberbox.IsBoxReachable;
import flow.stability._TestSpeed;
import flow.tv.WhatIStheTVIssue;
import tstool.process.Descision;


/**
 * ...
 * @author
 */
class IsTicketOpened extends Descision
{
	var next:flow.stability._TestSpeed;

	override public function create():Void
	{
		this._nextYesProcesses = [new IsTechTicket()];
		next = new _TestSpeed();
		
		
		if (Main.HISTORY.isInHistory("flow.Intro", No))
		{
			/************************************
			 * TV
			/************************************/
			
			this._nextNoProcesses = [new WhatIStheTVIssue()]; // old
			//this._nextNoProcesses = [new WhatIStheTVIssue()]; // new
		}
		else if (Main.HISTORY.isInHistory("flow.all.customer.IsSlowOrKaput", No))
		{
			/***********************************
			 * INTERNET
			/***********************************/
			this._nextNoProcesses =  [new IsBoxReachable()];
		}
		else if (Main.HISTORY.isInHistory("flow.all.customer.IsSlowOrKaput", Yes) || Main.HISTORY.isInHistory("flow.all.customer.IsSlowOrKaput", Mid))
		{
			/******************************************
			 * STABILITY
			/******************************************/
			Main.track.setActivity("slow-internet");
			if (Main.HISTORY.isInHistory("flow.all.customer.LanOrWiFi", No))
			{
				this._nextNoProcesses = [new _TestSpeed()];
				trace("Main.HISTORY.isInHistory(flow.all.customer.LanOrWiFi, No --> LAN");
				
			}
			else{
				trace("Main.HISTORY.isInHistory(flow.all.customer.LanOrWiFi, Yes or mid --> WiFI or Both");
				
				this._nextNoProcesses = [new flow.wifi._MoveCloseUnplugRepeater(next, next)];
			}
		}
		else {
			this._nextNoProcesses = [next];
			Main.track.setActivity("");
		}
		
		super.create();
	}
	
}