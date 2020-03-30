package flow.equipment;

import process.Action;
import process.Descision;

/**
 * ...
 * @author bb
 */
class IsStatusReturned extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new WasParcelInRothenbug()];
		this._nextYesProcesses = [new _AddNoteVtiCustDidNotFecthParcel()];
		super.create();
	}
	
}