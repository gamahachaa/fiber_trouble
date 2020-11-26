package flow.all.customer;

import flow.nointernet.vti.CheckContractorVTI;
import tstool.process.Triplet;

/**
 * ...
 * @author ...
 */
class LanOrWiFi extends Triplet 
{

	override public function create():Void
	{
		var next = new _ExplainMainSteps();
		this._nextNoProcesses = [ next ];
		this._nextYesProcesses = [ next ];
		this._nextMidProcesses = [ next ];
		super.create();
	}
	
}