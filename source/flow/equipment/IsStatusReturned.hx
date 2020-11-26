package flow.equipment;

//import tstool.process.Action;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsStatusReturned extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new WasParcelInRothenbug()];
		//this._nextYesProcesses = [new _AddNoteVtiCustDidNotFecthParcel()];
		this._nextYesProcesses = [new IsVTILaposteSendBoxMsgVisible()];
		super.create();
	}
	
}