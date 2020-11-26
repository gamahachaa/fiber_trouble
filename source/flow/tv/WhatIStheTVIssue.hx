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

	override public function create()
	{
		/***********************************
		 * SOUND
		/***********************************/
		this._nextNoProcesses = [new _StoreCustomersSetup()];
		/***********************************
		 * REMOTE
		/***********************************/
		this._nextYesProcesses = [ new WichRemote()];
		/***********************************
		 * TV
		/***********************************/
		this._nextMidProcesses = [ new IsAppleTVvisibleOnTVScreen()];
		super.create();
	}
}