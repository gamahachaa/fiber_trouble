package flow.salttv;

import flow.stability.HasLANDevice;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsImageJerky extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [ new _ChekSaltTVKNownBugs()];
		if (Main.HISTORY.isInHistory("flow.salttv.HasAppleAccount", No))
		{
			this._nextYesProcesses = [ new HasLANDevice()];
		}
		else{
			this._nextYesProcesses = [ new WhatAppleTVcnxType()];
		}
		
		super.create();
	}
	
}