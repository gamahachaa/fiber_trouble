package flow.swapcable;

import flow._AddMemoVti;
import process.ActionMailNointernet;
//import tstool.process.ActionMail;
import tstool.salt.SOTickets;
/**
 * ...
 * @author ...
 */
class _FiberCableByPost extends ActionMailNointernet
{
	public function new() 
	{
		super(SOTickets.FIX_712);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
}