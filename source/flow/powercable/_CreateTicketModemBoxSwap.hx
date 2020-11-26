package flow.powercable;

import tstool.process.ActionMail;
import tstool.salt.SOTickets;

/**
 * ...
 * @author ...
 */
class _CreateTicketModemBoxSwap extends ActionMail
{
	public function new() 
	{
		//super("5.2.3 :: Technical - Modem-Router - Box Swap (under condition)", Main.TECH_HIGH);
		super(SOTickets.FIX_523);
	}
	override public function create():Void
	{
		this._nextProcesses = [new _AddPowercableMemo()];
		super.create();
	}
}