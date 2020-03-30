package flow.salttv;

import process.Descision;

/**
 * ...
 * @author bb
 */
class IsImageJerky extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [ new _ChekSaltTVKNownBugs()];
		this._nextYesProcesses = [ new WhatAppleTVcnxType()];
		super.create();
	}
	
}