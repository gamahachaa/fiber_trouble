package flow.tv.services;

import flow._AddMemoVti;
import tstool.process.ActionMail;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _CreateTicketTwoOneFive extends ActionMail 
{

	public function new() 
	{
		super(SOTickets.FIX_215);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
}