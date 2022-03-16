package ;
import Main;
import lime.utils.Assets;
import tstool.layout.UI;
import tstool.utils.SwiftMailWrapper.Result;
import tstool.salt.TicketMail;
import tstool.salt.SOTickets;
import xapi.Activity;
import xapi.Verb;
import tstool.process.ActionTicket;
//import xapi.activities.Definition;

/**
 * ...
 * @author bb
 */
class ActionTicketFiberTrouble extends ActionTicket
{
	

	public function new(ticket: SOTickets, ?resolved:Bool=false)
	{
		super(ticket, resolved);
		
		var fut = Assets.getText("assets/data/ipv4_fut.txt");
		var fut_start:Float = new Date(2022, 1, 17, 0, 0, 0).getTime();
		#if debug
		trace('tstool.process.ActionTicket::ActionTicket::fut_start ${fut_start}');
		trace('tstool.process.ActionTicket::ActionTicket::Date.now().getTime() ${Date.now().getTime()}');
		#end
			
			if (fut.indexOf(Main.customer.contract.contractorID) >-1 && Date.now().getTime()>fut_start)
			{
				//this.ticket.desc = "MIGipV6 " + this.ticket.desc;
				
				this.ticket.queue = "FIBER_IP_MIGRATION_SO";
			}
			else if (Main.customer.contract.service == Office)
			{
				this.ticket.queue = "FIBER_SOHO_TECH_SO";
			}
		mail = new TicketMail(this.ticket, this, resolved);

		#if debug
		//trace(ticket);
		#end

	}
	

}