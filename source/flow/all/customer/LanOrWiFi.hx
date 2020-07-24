package flow.all.customer;

import flow.nointernet.vti.CheckContractorVTI;

import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class LanOrWiFi extends Descision 
{

	override public function create():Void
	{

		this._nextNoProcesses = [new CheckContractorVTI()];
		this._nextYesProcesses = [ new CheckContractorVTI()];
		super.create();
	}
	
}