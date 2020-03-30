package flow.lan;

import flow.all.customer._SendTechMail;
import process.ActionMail;

/**
 * ...
 * @author ...
 */
class _CreateLanIssueTicket extends ActionMail
{
	public function new() 
	{
		//super("5.2.1 :: Technical - Modem-Router - Modem Connection", Main.TECH_HIGH);
		super(Main.FIX_521);
		//mail.setSubject("LanIssue", this);
	}
	override public function create():Void
	{
		this._nextProcesses = [new _SendTechMail()];
		super.create();
	}
}