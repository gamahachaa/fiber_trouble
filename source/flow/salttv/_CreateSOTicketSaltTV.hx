package flow.salttv;

import flow.all.vti._AddMemoVti;
import process.ActionMail;

/**
 * ...
 * @author bb
 */
class _CreateSOTicketSaltTV extends ActionMail 
{

	public function new() 
	{
		super(Main.FIX_541);
	}
	override public function create()
	{
		this._nextProcesses = [new _AddMemoVti()];
		super.create();
	}
}