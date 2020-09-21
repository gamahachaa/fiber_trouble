package flow.tv;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CanExploreMenu extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [];
		this._nextYesProcesses = [new WhatIssueWithApp()];
		super.create();
	}
}