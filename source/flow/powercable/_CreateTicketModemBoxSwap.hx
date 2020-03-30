package flow.powercable;

import process.ActionMail;

/**
 * ...
 * @author ...
 */
class _CreateTicketModemBoxSwap extends ActionMail
{
	public function new() 
	{
		//super("5.2.3 :: Technical - Modem-Router - Box Swap (under condition)", Main.TECH_HIGH);
		super(Main.FIX_523);
	}
	override public function create():Void
	{
		this._nextProcesses = [new _AddPowercableMemo()];
		super.create();
	}
}