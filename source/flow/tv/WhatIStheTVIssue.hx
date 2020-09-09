package flow.tv;

import flow.tv.sound.StoreCustomersSetup;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class WhatIStheTVIssue extends Triplet 
{

	override public function create()
	{
		this._nextNoProcesses = [new StoreCustomersSetup()];
		this._nextYesProcesses = [];
		this._nextMidProcesses= [];
		super.create();
	}
}