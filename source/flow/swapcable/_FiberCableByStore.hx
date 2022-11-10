package flow.swapcable;

import flow._AddMemoVti;
import tstool.process.ActionTicket;
//import process.ActionMailNointernet;
//import tstool.process.Action;
//import tstool.process.ActionTicket;
//import tstool.process.ActionMail;
import tstool.salt.SOTickets;

/**
 * ...
 * @author ...
 */
//class _FiberCableByStore extends ActionTicketFiberTrouble
class _FiberCableByStore extends ActionTicket
{
	public function new() 
	{
		super(SOTickets.FIX_712, true);
	}
	
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
}
