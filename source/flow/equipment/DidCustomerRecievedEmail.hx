package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class DidCustomerRecievedEmail extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new VTIMailCliackAcceptSent()];
		this._nextYesProcesses = [new _InformShipmentStatusMyAccount()];
		super.create();
	}
	
}