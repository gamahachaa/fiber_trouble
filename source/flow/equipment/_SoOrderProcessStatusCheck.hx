package flow.equipment;

import flow.all.vti._AddMemoVti;
import process.ActionMail;
import salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _SoOrderProcessStatusCheck extends ActionMail 
{

	public function new() 
		{
			super(SOTickets.FIX_416);
		}
		override public function create():Void
		{
			this._nextProcesses = [new _AddMemoVti()];
			super.create();
		}
	
}