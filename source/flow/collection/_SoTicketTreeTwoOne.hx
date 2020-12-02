package flow.collection;

import tstool.process.ActionMail;
import tstool.salt.SOTickets;

/**
 * ...
 * @author ...
 */
class _SoTicketTreeTwoOne extends ActionMail 
{
	public function new() 
	{
		super(SOTickets.FIX_311);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: _YouWillBeInformed, params: []}];
		super.onClick();
	}
}