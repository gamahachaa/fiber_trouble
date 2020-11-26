package flow.equipment;

import tstool.process.Action;

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