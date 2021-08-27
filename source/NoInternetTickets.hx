package;

import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class NoInternetTickets extends ActionTicket 
{

	public function new(ticket:SOTickets, ?resolved:Bool=false) 
	{
		super(ticket, resolved);
		
	}
	
}