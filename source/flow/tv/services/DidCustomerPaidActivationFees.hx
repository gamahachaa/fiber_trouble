package flow.tv.services;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class DidCustomerPaidActivationFees extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [ new DoesWantTVNow()];
		this._nextYesProcesses = [new _ChangeBasicPackage()];
		super.create();
	}
	
}