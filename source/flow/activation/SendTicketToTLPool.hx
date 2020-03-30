package flow.activation;

import process.Action;

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
		this._nextProcesses = [new End()];
		super.create();
	}
	
}