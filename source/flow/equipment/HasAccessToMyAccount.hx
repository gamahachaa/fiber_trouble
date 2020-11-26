package flow.equipment;

import flow._AddMemoVti;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HasAccessToMyAccount extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [ new _SoOTOGivenByCustomer()];
		this._nextYesProcesses = [ new _AddMemoVti()];
		super.create();
	}
	
}