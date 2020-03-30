package flow.equipment;

import process.Action;

/**
 * ...
 * @author bb
 */
class _TellCustWeSendParcelBackAgain extends Action 
{

override public function create()
	{
		this._nextProcesses = [ new IsStatusDelivered()];
		super.create();
	}
	
}