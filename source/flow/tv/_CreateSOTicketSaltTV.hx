package flow.tv;

import flow._AddMemoVti;
import tstool.process.ActionMail;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _CreateSOTicketSaltTV extends ActionMail 
{

	public function new() 
	{
		super(SOTickets.FIX_541);
	}
	override public function create()
	{
		this._nextProcesses = [new flow._AddMemoVti()];
		super.create();
	}
}