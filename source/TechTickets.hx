package;

import flow.nointernet.vti.CheckContractorVTI;
import flow.tickets.CustomerInstruction;
//import lime.utils.Assets;
//import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class TechTickets extends ActionTicketFiberTrouble
{

	public function new(ticket:SOTickets, ?resolved:Bool=false)
	{
		
		try
		{
			var is_sagem:Bool = Main.customer.dataSet.get(CheckContractorVTI.CUST_DATA_PRODUCT).get(CheckContractorVTI.CUST_DATA_PRODUCT_BOX) == CheckContractorVTI.SAGEM;
             
			//, [CheckContractorVTI.CUST_DATA_PRODUCT_BOX => (arcadyan?CheckContractorVTI.ARCADYAN: CheckContractorVTI.SAGEM)]);
			if (is_sagem && ticket.queue.indexOf("_X6_")==-1 && !(Main.customer.contract.service == Office))
			{
				ticket.queue = StringTools.replace(ticket.queue, "_SO", "_X6_SO");
			}
			

		}
		catch (e)
		{
			// if box was unkown.
		}
		super(ticket, resolved);

	}
    override public function create()
	{
		super.create();
		var contact = Main.HISTORY.findValueOfFirstClassInHistory(CustomerInstruction, CustomerInstruction.CONTACT_NUMBER);
		if(contact.exists)
			this.details.textField.htmlText = "Contact : " + contact.value;
	}
}