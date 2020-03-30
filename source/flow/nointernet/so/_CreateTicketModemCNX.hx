package flow.nointernet.so;

import flow.all.customer._SendTechMail;
import process.ActionMail;
import process.TicketSendSub;
//import process.Action;

/**
 * ...
 * @author ...
 */
class _CreateTicketModemCNX extends ActionMail 
{
	
	public function new() 
	{
		super(Main.FIX_521);
	}
	
	override public function create():Void
	{
		this._nextProcesses = [new _SendTechMail()];
		super.create();
		
		
	}
}