package;

import flow.nointernet.vti.CheckContractorVTI;
import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class TechTickets extends ActionTicket 
{

	public function new(ticket:SOTickets, ?resolved:Bool=false) 
	{
		var is_sagem:Bool = Main.customer.dataSet.get(CheckContractorVTI.CUST_DATA_PRODUCT).get(CheckContractorVTI.CUST_DATA_PRODUCT_BOX) == CheckContractorVTI.SAGEM;
		//, [CheckContractorVTI.CUST_DATA_PRODUCT_BOX => (arcadyan?CheckContractorVTI.ARCADYAN: CheckContractorVTI.SAGEM)]);
		if (is_sagem)
		{
			var tq = ticket.queue;
			ticket.queue = StringTools.replace(tq, "_SO", "_X6_SO");
		}
		super(ticket, resolved);
		
	}
	
}