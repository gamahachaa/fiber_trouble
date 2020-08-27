package flow.equipment;

import flow.End;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _AddNoteVtiCustDidNotFecthParcel extends Action 
{

	override public function create()
	{
		this._nextProcesses = [ new flow.End()];
		super.create();
	}
	
}