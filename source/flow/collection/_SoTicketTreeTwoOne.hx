package flow.collection;

import tstool.process.ActionMail;
import tstool.salt.SOTickets;

/**
 * ...
 * @author ...
 */
class _SoTicketTreeTwoOne extends ActionMail 
{
	public function new() 
	{
		//super("3.2.1 :: Billing - Compensation - Request for compensation", Main.TECH_HIGH);
		//super(SOTickets.FIX_321);
		super(SOTickets.FIX_311);
	}
	override public function create():Void
	{
		this._nextProcesses = [new _YouWillBeInformed()];
		super.create();
	}
	
}