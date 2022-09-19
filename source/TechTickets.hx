package;

import flow.nointernet.vti.CheckContractorVTI;
import flow.tickets.CustomerInstruction;
//import lime.utils.Assets;
//import tstool.process.ActionTicket;
import tstool.salt.SOTickets;
import flow.all.fiberbox.WhatBoxIsIt;

/**
 * ...
 * @author bb
 */
class TechTickets extends ActionTicketFiberTrouble
{

	public function new(ticket:SOTickets, ?resolved:Bool=false)
	{
		var t:SOTickets = null;
		try
		{
			var is_sagem:Bool = Main.customer.dataSet.get(CheckContractorVTI.CUST_DATA_PRODUCT).get(CheckContractorVTI.CUST_DATA_PRODUCT_BOX) == Std.string(Sagem) ;
			var is_gigabox:Bool = Main.customer.dataSet.get(CheckContractorVTI.CUST_DATA_PRODUCT).get(CheckContractorVTI.CUST_DATA_PRODUCT_BOX) == Std.string(Gigabox) ;
//"Gigabox"             

			if (is_sagem && ticket.queue.indexOf("_X6_")==-1 && !(Main.customer.contract.service == Office))
			{
				//ticket.queue = StringTools.replace(ticket.queue, "_SO", "_X6_SO");
				t = new SOTickets( ticket.domain, ticket.number, StringTools.replace(ticket.queue, "_SO", "_X6_SO"), ticket.desc, ticket.email);
			}
			else if (is_gigabox)
			{
				//ticket.queue = "FIBER_TECH_GIGABOX_SO";
				t = new SOTickets( ticket.domain, ticket.number, "FIBER_TECH_GIGABOX_SO", ticket.desc, ticket.email);
			}
			else t = ticket;
			super(t, resolved);

		}
		catch (e)
		{
			// if box was unkown.
			trace("box unkown.");
		}
		

	}
    override public function create()
	{
		super.create();
		#if debug
		trace("TechTickets::create 1");
		#end
		var contact = Main.HISTORY.findValueOfFirstClassInHistory(CustomerInstruction, CustomerInstruction.CONTACT_NUMBER);
		#if debug
		trace("TechTickets::create 2");
		#end
		if(contact.exists)
			this.details.textField.htmlText = "Contact : " + contact.value;
	}
}