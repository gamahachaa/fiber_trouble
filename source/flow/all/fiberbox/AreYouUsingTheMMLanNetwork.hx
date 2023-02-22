package flow.all.fiberbox;

import flow.all.customer.LanOrWiFi;
import flow.stability._TestSpeed;
import flow.tv.WhatIStheTVIssue;
import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import flow.tv.sound._MakeSureHDMIWellConnected;
import flow.wifi.HaveRepeater;
import flow.wifi._InformAboutRepeaterGoodness;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class AreYouUsingTheMMLanNetwork extends Descision
{

	override public function onYesClick():Void
	{
		if (Main.HISTORY.isClassInteractionInHistory(WhatIStheTVIssue, No))
		{
			/************************************
			 * TV    SOUND
			/************************************/
			this._nexts = [ {step: _MakeSureHDMIWellConnected}];
		}
		else if (Main.HISTORY.isClassInteractionInHistory(WhatIStheTVIssue, Mid))
		{
			/************************************
			 * TV    FLOW
			/************************************/
			this._nexts = [ {step: IsAppleTVvisibleOnTVScreen}];
		}
		else
		{
			if (Main.HISTORY.isClassInteractionInHistory(LanOrWiFi, No))
			{
				// LAN
				this._nexts = [ {step: _TestSpeed}];
			}
			else
			{
				// Wifi or Both
				this._nexts = [ {step: HaveRepeater}];
			}
		}
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		//this._nexts = [{step: _AdvicePutOpenSpace, params: []}];
		this._nexts = [{step: _InformAboutRepeaterGoodness, params: []}];
		super.onNoClick();
	}

}