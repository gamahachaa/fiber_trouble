package flow.nointernet.vti;

import tstool.process.ActionMail;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _SoOrderNotComplete extends ActionMail 
{

	public function new(ticket:SOTickets, ?resolved:Bool=false) 
	{
		super(ticket, resolved);
		
	}
	
}