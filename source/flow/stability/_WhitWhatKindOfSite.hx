package flow.stability;

import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class _WhitWhatKindOfSite extends Triplet 
{

	override public function create()
	{
		var next = new _WhatToolItOccursWith();
		this._nextNoProcesses = [next];
		this._nextYesProcesses = [next];
		this._nextMidProcesses= [next];
		super.create();
	}
	
}