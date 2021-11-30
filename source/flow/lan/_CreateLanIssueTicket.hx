package flow.lan;

import flow.all.customer._SendTechMail;
//import process.ActionMailNointernet;
import tstool.process.ActionTicket;
//import tstool.process.ActionMail;
import tstool.salt.SOTickets;

/**
 * ...
 * @author ...
 */
class _CreateLanIssueTicket extends TechTickets
{
	public function new() 
	{
		//super("5.2.1 :: Technical - Modem-Router - Modem Connection", Main.TECH_HIGH);
		super(SOTickets.FIX_521);
		//mail.setSubject("LanIssue", this);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: _SendTechMail, params: []}];
		super.onClick();
	}
}