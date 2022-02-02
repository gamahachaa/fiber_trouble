package flow.nointernet.so;

import flow.all.customer.IsSlowOrKaput;
import flow.all.customer.LanOrWiFi;
//import flow.all.customer.WhichBox;
import flow.equipment.IsWhishDateWayAhead;
import flow.escalation.IsTechTicket;
import flow.nointernet.fiberbox.IsBoxReachable;
import flow.stability._TestSpeed;
import flow.stability.atf.IsFWToTheLatest;
import flow.tv.WhatIStheTVIssue;
import flow.wifi.HaveRepeater;
import flow.wifi._MoveCloseUnplugRepeater;
import tstool.process.Descision;


/**
 * ...
 * @author
 */
class IsTicketOpened extends Descision
{
	
	
	override public function onYesClick():Void
	{
		this._nexts = [{step: IsTechTicket, params: []}];
		super.onYesClick();
	}
	//override public function onNoClick():Void
	//{
		//this._nexts = [{step: WhichBox, params: []}];
		//super.onNoClick();
	//}
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
		else if (Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, Yes) || Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, Mid))
		{
			#if debug
			//trace("flow.nointernet.so.IsTicketOpened::onNoClick:: STABILITY" );
			#end
			/******************************************
			 * STABILITY
			/******************************************/
			#if debug
			//trace("flow.nointernet.so.IsTicketOpened::onNoClick::Main.HISTORY.isClassInteractionInHistory(LanOrWiFi, No)", Main.HISTORY.isClassInteractionInHistory(LanOrWiFi, No) );
			#end
			if (Main.HISTORY.isClassInteractionInHistory(LanOrWiFi, No))
			{
				this._nexts = [{step: _TestSpeed, params: []}];
			}
			else
			{
				this._nexts = [{step:HaveRepeater}];
			}
		}
		else
			this._nexts = [{step: _TestSpeed, params: []}];
		
		super.onNoClick();
	}
}