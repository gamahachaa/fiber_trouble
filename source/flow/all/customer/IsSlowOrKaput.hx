package flow.all.customer;

import flow.nointernet.vti.CheckContractorVTI;
//import process.Descision;
import process.Triplet;

/**
 * ...
 * @author bb
 */
class IsSlowOrKaput extends Triplet 
{
	override public function create()
	{
		var next = new CheckContractorVTI();
		this._nextNoProcesses = [next];
		this._nextYesProcesses = [next];
		this._nextMidProcesses = [next];
		super.create();
	}
}