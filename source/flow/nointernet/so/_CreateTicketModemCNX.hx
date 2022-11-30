package flow.nointernet.so;

import flow.all.customer._SendTechMail;
import flow.vti.ParseVTIHealthCheck;
import tstool.layout.History.ValueReturn;
//import process.ActionMailNointernet;
//import tstool.process.ActionTicket;
//import tstool.process.ActionMail;
//import tstool.process.TicketSendSub;
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
		var t:SOTickets = SOTickets.FIX_521;
		if ( Main.HISTORY.isClassInHistory(ParseVTIHealthCheck))
		{
			var values = Main.HISTORY.findAllValuesOffOfFirstClassInHistory(ParseVTIHealthCheck);
			var newDesc = t.desc + ' FLL=' + [for (k=>v in values) v].join("|");
			//var newDesc = t.desc + ' FLL=' + [for (k=>v in values) (k+":"+Std.string(v))].join("|");
			t = new SOTickets(t.domain, t.number, t.queue, newDesc, t.email);
		}
		super(t);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: _SendTechMail, params: []}];
		super.onClick();
	}
}