package flow.stability;

import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class _WhatIsTheSlowIssue extends Triplet 
{

	override public function create()
	{
		var next = new _WhenDidItStart();
		this._nextNoProcesses = [];
		this._nextYesProcesses = [];
		this._nextMidProcesses= [];
		super.create();
	}
	
}