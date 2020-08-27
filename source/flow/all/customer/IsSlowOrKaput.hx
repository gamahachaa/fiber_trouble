package flow.all.customer;

import flow.nointernet.vti.CheckContractorVTI;
//import flow.stability._WhatIsTheSlowIssue;
//import process.Descision;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class IsSlowOrKaput extends Triplet 
{
	override public function create()
	{
		var next = new CheckContractorVTI();
		var next2 = new HowManyDevicesAreConnected();
		
		this._nextNoProcesses = [next];
		this._nextYesProcesses = [next2];
		this._nextMidProcesses = [next2];
		super.create();
	}
}