package flow.wifi;

import flow.all.customer._SendTechMail;
import tstool.process.ActionMail;
import tstool.salt.SOTickets;

/**
 * ...
 * @author ...
 */
class _CreateTicketWifiIssue extends ActionMail
{
	public function new() 
	{
		super(SOTickets.FIX_522);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: _SendTechMail, params: []}];
		super.onClick();
	}
}