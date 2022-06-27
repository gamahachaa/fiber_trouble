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
		super(ticket, resolved);

		//var fut = Assets.getText("assets/data/ipv4_fut.txt");
		//var seven = Assets.getText("assets/data/tmp/79HON.txt");
		//var plan_les_ouates = Assets.getText("assets/data/plan_les_ouates.txt");
		//var fut_start:Float = new Date(2022, 1, 17, 0, 0, 0).getTime();
		#if debug
		//trace('tstool.process.ActionTicket::ActionTicket::fut_start ${fut_start}');
		//trace('tstool.process.ActionTicket::ActionTicket::Date.now().getTime() ${Date.now().getTime()}');
		#end

		/*if (fut.indexOf(Main.customer.contract.contractorID) >-1 && Date.now().getTime()>fut_start)
		{
			//this.ticket.desc = "MIGipV6 " + this.ticket.desc;

			this.ticket.queue = "FIBER_IP_MIGRATION_SO";
		}
		else */
		if (Main.customer.contract.service == Office)
		{
			this.ticket.queue = "FIBER_SOHO_TECH_SO";
		}
		var a:String = "";
		for (i in Assets.list(AssetType.TEXT))
		{
			if (i.indexOf(Main.TMP_FILTER_ASSET_PATH) >-1)
			{
				a =  Assets.getText(i);

				if ( a.indexOf( Main.customer.contract.contractorID) >-1)
				{
					renameticket(i.replace(Main.TMP_FILTER_ASSET_PATH,"").replace(".txt",""));
				}
			}
		}
		//if (plan_les_ouates.indexOf(Main.customer.contract.contractorID) >-1)
		//{
		//this.ticket.desc = "PLANLESOUTATES " + this.ticket.desc;
		//}
		//if (seven.indexOf(Main.customer.contract.contractorID) >-1)
		//{
		//this.ticket.desc = "79HON " + this.ticket.desc;
		//}
		mail = new TicketMail(this.ticket, this, resolved);

		#if debug
		//trace(ticket);
		#end

	}
	function renameticket(s:String)
	{
		this.ticket.desc = ' $s ${this.ticket.desc}';
	}

}