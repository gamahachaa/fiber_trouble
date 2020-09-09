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

	override public function create():Void
	{
		this._nextYesProcesses = [new IsTechTicket()];
		
		if (Main.HISTORY.isInHistory("flow.Intro", Mid))
		{
			/***************************************
			 * Equipment
			/***************************************/
			this._nextNoProcesses = [new IsWhishDateWayAhead()];
			
		}
		else if (Main.HISTORY.isInHistory("flow.Intro", No))
		{
			/************************************
			 * TV
			/************************************/
			
			this._nextNoProcesses = [new WhatIStheTVIssue()];
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
			this._nextNoProcesses = [new flow.wifi._MoveCloseUnplugRepeater(new _TestSpeed(), new _TestSpeed())];
		}
		else {
			Main.track.setActivity("");
		}
		
		super.create();
	}

}