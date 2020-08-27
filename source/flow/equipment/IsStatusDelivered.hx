package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsStatusDelivered extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _TellCustToGoToPost()];
		this._nextYesProcesses = [new _GiveStatusAndRemindMyaccount()];
		super.create();
	}
	
}