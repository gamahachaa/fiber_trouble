package flow.all.customer;

import flow.nointernet.vti.CheckContractorVTI;
import process.Descision;

/**
 * ...
 * @author bb
 */
class IsSlowOrKaput extends Descision 
{
	override public function create()
	{
		var next = new CheckContractorVTI();
		this._nextNoProcesses = [next];
		this._nextYesProcesses = [next];
		super.create();
	}
}