package flow.nointernet.so;

import flow.all.customer._SendTechMail;
//import process.ActionMailNointernet;
import tstool.process.ActionTicket;
//import tstool.process.ActionMail;
import tstool.process.TicketSendSub;
import tstool.salt.SOTickets;
//import process.Action;

/**
 * ...
 * @author ...
 */
class _CreateTicketModemCNX extends TechTickets 
{
	
	public function new() 
	{
		super(SOTickets.FIX_521);
	}
	
	override public function onClick():Void
	{
		this._nexts = [{step: _SendTechMail, params: []}];
		super.onClick();
	}
}