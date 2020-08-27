package flow.lan;

import flow.all.customer._SendTechMail;
import tstool.process.ActionMail;
import tstool.salt.SOTickets;

/**
 * ...
 * @author ...
 */
class _CreateLanIssueTicket extends ActionMail
{
	public function new() 
	{
		//super("5.2.1 :: Technical - Modem-Router - Modem Connection", Main.TECH_HIGH);
		super(SOTickets.FIX_521);
		//mail.setSubject("LanIssue", this);
	}
	override public function create():Void
	{
		this._nextProcesses = [new _SendTechMail()];
		super.create();
	}
}