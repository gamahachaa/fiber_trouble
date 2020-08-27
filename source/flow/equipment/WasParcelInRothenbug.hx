package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WasParcelInRothenbug extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new IsStatusDelivered()];
		this._nextYesProcesses = [new IsVTILaposteSendBoxMsgVisible()];
		super.create();
	}
	
}