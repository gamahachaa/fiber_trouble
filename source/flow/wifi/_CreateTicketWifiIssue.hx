package flow.wifi;

import flow.all.customer._SendTechMail;
import process.ActionMail;

/**
 * ...
 * @author ...
 */
class _CreateTicketWifiIssue extends ActionMail
{
	public function new() 
	{
		//super("5.2.2 :: Technical - Modem-Router - Probléme de Wifi / Wlan", Main.TECH_LOW);
		super(Main.FIX_522);
		//mail.setSubject(,this);
	}
	override public function create():Void
	{
		this._nextProcesses = [new _SendTechMail()];
		super.create();

	}
}