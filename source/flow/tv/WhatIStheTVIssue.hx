package flow.tv;

import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import flow.tv.remote.WichRemote;
import flow.tv.sound._StoreCustomersSetup;
import tstool.process.Triplet;
/**
 * ...
 * @author bb
 */
class WhatIStheTVIssue extends Triplet 
{
	override public function onYesClick():Void
	{
		/***********************************
		 * TV
		/***********************************/
		this._nexts = [{step: WichRemote, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		/***********************************
		 * SOUND
		/***********************************/
		this._nexts = [{step: _StoreCustomersSetup, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		/***********************************
		 * REMOTE
		/***********************************/
		this._nexts = [{step: IsAppleTVvisibleOnTVScreen, params: []}];
		super.onMidClick();
	}
}