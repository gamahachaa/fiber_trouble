package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HasCustomerEmailAddress extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _SendParcelTrackingBySMS()];
		this._nextYesProcesses = [new _ResendValidationEmail()];
		super.create();
	}
	
}