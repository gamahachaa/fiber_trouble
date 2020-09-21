package flow.tv;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WhatIssueWithApp extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [];
		this._nextYesProcesses = [new ChekSaltTVKNownBugs()];
		super.create();
	}
	
}