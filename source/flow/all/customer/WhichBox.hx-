package flow.all.customer;

import flow.nointernet.fiberbox.IsBoxReachable;
import flow.stability._TestSpeed;
import flow.tv.WhatIStheTVIssue;
import flow.wifi.HaveRepeater;
import flow.wifi._MoveCloseUnplugRepeater;
import js.Browser;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class WhichBox extends Descision 
{
	override public function create()
	{
		super.create();
		/**
			 * @TODO keep clipboard trick to fill clipboard with data
			 */
		Browser.document.addEventListener("copy", function(e){e.clipboardData.setData('text/plain', Main.customer.contract.contractorID);e.preventDefault();});
	}
	override public function onYesClick():Void
	{
		this._nexts = next();
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = next();
		super.onNoClick();
	}
	inline function next():Array<ProcessContructor>
	{
		return if (Main.HISTORY.isClassInteractionInHistory(Intro, No))
		{
			/************************************
			 * TV
			/************************************/
			[{step: WhatIStheTVIssue, params: []}];
		}
		else if (Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, No))
		{
			/***********************************
			 * INTERNET
			/***********************************/
			[{step: IsBoxReachable, params: []}];
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
				[{step: _TestSpeed, params: []}];
			}
			else
			{
				[{
					step: _MoveCloseUnplugRepeater,
					params: [
						{step:HaveRepeater}, 
						{step:HaveRepeater}
					]
			}];
			}
		}
		else
			[{step: _TestSpeed, params: []}];
	}
}