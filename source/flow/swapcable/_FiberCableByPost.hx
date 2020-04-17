package flow.swapcable;

import flow.all.vti._AddMemoVti;
import process.ActionMail;
import salt.SOTickets;
/**
 * ...
 * @author ...
 */
class _FiberCableByPost extends ActionMail
{
	public function new() 
	{
		//super("5.2.6 :: Technical - Modem-Router - New Fibre Cable request (send by post)", Main.TECH_HIGH);
		super(SOTickets.FIX_526);
	}
	override public function create():Void
	{
		this._nextProcesses = [new _AddMemoVti()];
		super.create();
	}
	
}