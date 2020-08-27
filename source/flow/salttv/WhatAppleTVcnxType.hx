package flow.salttv;

import flow.stability.HasAppleTV;
import flow.stability.HasLANDevice;
import flow.stability.WasREbootDone;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WhatAppleTVcnxType extends Descision
{

	override public function create()
	{
		if (Main.HISTORY.isInHistory("flow.salttv.HasAppleAccount", Yes))
		{
			this._nextNoProcesses = [ new _InstallSpeedTestAplleTV() ];
		}
		else
			this._nextNoProcesses = [ new WasREbootDone()];
		this._nextYesProcesses = [ new _ConnectAppleTVtoOneGhz()];
		
		super.create();
	}
}