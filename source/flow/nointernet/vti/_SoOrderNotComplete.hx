package flow.nointernet.vti;

import flow._AddMemoVti;
//import process.ActionMailNointernet;
import tstool.process.ActionTicket;
//import tstool.process.ActionMail;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _SoOrderNotComplete extends ActionTicket 
{

	public function new() 
	{
		super(SOTickets.FIX_414);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
}