package flow.nointernet.so.tckets;

import process.ActionMail;
import salt.SOTickets;

class _SwapBox extends ActionMail {
	public function new() 
	{
		//super("5.2.3 :: Technical - Modem-Router - Box Swap (under condition)", Main.TECH_HIGH);
		super(SOTickets.FIX_523);
	}
    override public function create():Void
	{
		this._nextProcesses = [new End()];
		super.create();
	}
}