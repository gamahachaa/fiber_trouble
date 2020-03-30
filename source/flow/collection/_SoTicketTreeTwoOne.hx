package flow.collection;

import process.ActionMail;

/**
 * ...
 * @author ...
 */
class _SoTicketTreeTwoOne extends ActionMail 
{
	public function new() 
	{
		//super("3.2.1 :: Billing - Compensation - Request for compensation", Main.TECH_HIGH);
		super(Main.FIX_321);
	}
	override public function create():Void
	{
		this._nextProcesses = [new _YouWillBeInformed()];
		super.create();
	}
	
}