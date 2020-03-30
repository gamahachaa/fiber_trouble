package flow.equipment;

import flow.nointernet.customer.HasCustomerLEXnetworkIssue;
import process.Descision;

/**
 * ...
 * @author bb
 */
class VTIMailCliackAcceptSent extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new HasCustomerEmailAddress()];
		this._nextYesProcesses = [new _SendParcelTrackingByEmail()];
		super.create();
	}
	
}