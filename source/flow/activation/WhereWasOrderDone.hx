package flow.activation;

import process.DescisionInput;

/**
 * ...
 * @author bb
 */
class WhereWasOrderDone extends DescisionInput 
{

	public function new() 
	{
		super(280, "Store");
		
	}
	override public function create()
	{
		this._nextNoProcesses = [new SendTicketToTLPool()];
		this._nextYesProcesses = [new SendTicketToTLPool()];
		super.create();
	}
	
}