package flow.nointernet.vti;

import flow._AddMemoVti;
import tstool.process.ActionMail;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _SoOrderNotComplete extends ActionMail 
{

	public function new() 
	{
		super(SOTickets.FIX_414);
	}
	override public function create():Void
	{
		this._nextProcesses = [new _AddMemoVti()];
		super.create();
	}
	
}