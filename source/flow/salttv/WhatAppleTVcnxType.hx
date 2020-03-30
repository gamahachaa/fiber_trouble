package flow.salttv;

import process.Descision;

/**
 * ...
 * @author bb
 */
class WhatAppleTVcnxType extends Descision
{

	override public function create()
	{
		this._nextNoProcesses = [ new _CheckSaltTVwithOtherDevice()];
		this._nextYesProcesses = [ new _ConnectAppleTVtoOneGhz()];
		super.create();
	}
}