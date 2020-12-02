package flow.nointernet.so;

import flow.all.customer.IsSlowOrKaput;
import flow.all.customer.LanOrWiFi;
import flow.equipment.IsWhishDateWayAhead;
import flow.escalation.IsTechTicket;
import flow.nointernet.fiberbox.IsBoxReachable;
import flow.stability._TestSpeed;
import flow.tv.WhatIStheTVIssue;
import flow.wifi._MoveCloseUnplugRepeater;
import tstool.process.Descision;


/**
 * ...
 * @author
 */
class IsTicketOpened extends Descision
{
	
	//var next:flow.stability._TestSpeed;
	/*
	override public function create():Void
	{
		this._nextYesProcesses = [new IsTechTicket()];
		next = new _TestSpeed();
	
		
		if (Main.HISTORY.isInHistory("flow.Intro", No))
		{
			this._nextNoProcesses = [new WhatIStheTVIssue()]; 
		}
		else if (Main.HISTORY.isInHistory("flow.all.customer.IsSlowOrKaput", No))
		{
			
			this._nextNoProcesses =  [new IsBoxReachable()];
		}
		else if (Main.HISTORY.isInHistory("flow.all.customer.IsSlowOrKaput", Yes) || Main.HISTORY.isInHistory("flow.all.customer.IsSlowOrKaput", Mid))
		{
			
			//Main.track.setActivity("slow-internet");
			if (Main.HISTORY.isInHistory("flow.all.customer.LanOrWiFi", No))
			{
				this._nextNoProcesses = [new _TestSpeed()];
				//trace("Main.HISTORY.isInHistory(flow.all.customer.LanOrWiFi, No --> LAN");
				
			}
			else{
				//trace("Main.HISTORY.isInHistory(flow.all.customer.LanOrWiFi, Yes or mid --> WiFI or Both");
				
				this._nexts = [{
					step:flow.wifi._MoveCloseUnplugRepeater,
					params: [
						{step:_TestSpeed}, 
						{step:_TestSpeed}
					]
			}];
			}
		}
		else {
			this._nextNoProcesses = [next];
			Main.track.setActivity("");
		}
		
		super.create();
	}*/
	override public function onYesClick():Void
	{
		this._nexts = [{step: IsTechTicket, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		if (Main.HISTORY.isClassInteractionInHistory(Intro, No))
		{
			/************************************
			 * TV
			/************************************/
			this._nexts = [{step: WhatIStheTVIssue, params: []}];
		}
		else if (Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, No))
		{
			/***********************************
			 * INTERNET
			/***********************************/
			this._nexts = [{step: IsBoxReachable, params: []}];
		}
		else if (Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, Yes) && Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, Mid))
		{
			/******************************************
			 * STABILITY
			/******************************************/
			if (Main.HISTORY.isClassInteractionInHistory(LanOrWiFi, No))
			{
				this._nexts = [{step: _TestSpeed, params: []}];
			}
			else
			{
				this._nexts = [{
					step: _MoveCloseUnplugRepeater,
					params: [
						{step:_TestSpeed}, 
						{step:_TestSpeed}
					]
			}];
			}
		}
		else
			this._nexts = [{step: _TestSpeed, params: []}];
		
		super.onNoClick();
	}
}