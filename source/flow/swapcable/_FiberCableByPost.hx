package flow.swapcable;

import flow._AddMemoVti;
import tstool.process.ActionMail;
import tstool.salt.SOTickets;
/**
 * ...
 * @author ...
 */
class _FiberCableByPost extends ActionMail
{
	public function new() 
	{
		//super("5.2.6 :: Technical - Modem-Router - New Fibre Cable request (send by post)", Main.TECH_HIGH);
		//super(SOTickets.FIX_526);
		super(SOTickets.FIX_712);
	}
	override public function create():Void
	{
		this._nextProcesses = [new flow._AddMemoVti()];
		super.create();
	}
	
}