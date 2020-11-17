package flow.swapcable;

import flow._AddMemoVti;
import tstool.process.ActionMail;
import tstool.salt.SOTickets;
/**
 * ...
 * @author ...
 */
class _FiberCableByPost extends ActionMail
{
	public function new() 
	{
		super(SOTickets.FIX_712);
	}
	override public function create():Void
	{
		this._nextProcesses = [new flow._AddMemoVti()];
		super.create();
	}
	
}