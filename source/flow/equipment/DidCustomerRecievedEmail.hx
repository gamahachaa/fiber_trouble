package flow.equipment;

import process.Descision;

/**
 * ...
 * @author bb
 */
class DidCustomerRecievedEmail extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new VTIMailCliackAcceptSent()];
		this._nextYesProcesses = [];
		super.create();
	}
	
}