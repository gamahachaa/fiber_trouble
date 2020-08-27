package flow.activation;

import flow.End;
import tstool.process.Action;

/**
 * ...
 * @author bbaudry
 */
class SendTicketToTLPool extends Action 
{

	override public function create():Void
	{
		/**
		 * @todo illustration
		 */
		this._nextProcesses = [new flow.End()];
		super.create();
	}
	
}