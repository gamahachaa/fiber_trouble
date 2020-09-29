package flow.equipment;

import flow._AddMemoVti;
import tstool.process.ActionMail;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _SoOrderProcessStatusCheck extends ActionMail 
{

	public function new() 
		{
			//super(SOTickets.FIX_416);
			super(SOTickets.FIX_415);
		}
		override public function create():Void
		{
			this._nextProcesses = [new flow._AddMemoVti()];
			super.create();
		}
	
}