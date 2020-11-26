package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsPlugInUse extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [ new IsWhishDateWayAhead()];
		this._nextYesProcesses = [new DidCustomerSendProffCancel()];
		super.create();
	}
	
}