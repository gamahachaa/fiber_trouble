package flow.all.customer;

import flow.nointernet.vti.CheckContractorVTI;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ExplainMainSteps extends Action 
{

	override public function create()
	{
		this._nextProcesses = [ new CheckContractorVTI()];
		super.create();
	}
	
}