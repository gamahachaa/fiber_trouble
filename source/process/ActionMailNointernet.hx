package process;

import flow.nointernet.vti.CheckContractorVTI;
import tstool.process.ActionTicket;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class ActionMailNointernet extends ActionTicket
{

	public function new(ticket:SOTickets, ?resolved:Bool=false) 
	{
		/**
		 * @todo this is temporary remove when SAGEM BOX is gone
		 */
		var t = new SOTickets(
			ticket.domain,
			ticket.number,
			chekcIfSagem() ? SOTickets.FIX_999.queue : ticket.queue,
			ticket.desc,
			ticket.email
			);
		super(t, resolved);
	}
	inline function chekcIfSagem()
	{
		if (Main.customer.dataSet != null)
		{
			if (Main.customer.dataSet.exists(CheckContractorVTI.CUST_DATA_PRODUCT))
			{
				if (Main.customer.dataSet.get(CheckContractorVTI.CUST_DATA_PRODUCT).exists(CheckContractorVTI.CUST_DATA_PRODUCT_BOX))
				{
					return Main.customer.dataSet.get(CheckContractorVTI.CUST_DATA_PRODUCT).get(CheckContractorVTI.CUST_DATA_PRODUCT_BOX) == CheckContractorVTI.SAGEM;
				}
				else return false;
			}
			else return false;
		}
		else return false;
	}
}