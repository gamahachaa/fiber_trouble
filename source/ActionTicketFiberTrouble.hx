package ;
import Main;
import lime.utils.AssetType;
import lime.utils.Assets;
import tstool.layout.UI;
import tstool.utils.SwiftMailWrapper.Result;
import tstool.salt.TicketMail;
import tstool.salt.SOTickets;
import xapi.Activity;
import xapi.Verb;
import tstool.process.ActionTicket;
import tstool.salt.SuperOffice; // NEEDED FOR ENUM
using StringTools;
//import xapi.activities.Definition;

/**
 * ...
 * @author bb
 */
class ActionTicketFiberTrouble extends ActionTicket
{

	public function new(ticket: SOTickets, ?resolved:Bool=false)
	{

		var m = [ queues => "FIBER_SOHO_TECH_SO" ];
		super( Main.customer.contract.service == Office? cast ticket.cloneWithNewAttributes(m): ticket, resolved);
		
		mail = new TicketMail(cast this.ticket, this, resolved);

		#if debug
		//trace(ticket);
		#end

	}
	

}