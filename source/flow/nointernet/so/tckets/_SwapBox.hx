package flow.nointernet.so.tckets;

import flow.End;
import tstool.process.ActionMail;
import tstool.salt.SOTickets;

class _SwapBox extends ActionMail {
	public function new() 
	{
		super(SOTickets.FIX_523);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: End, params: []}];
		super.onClick();
	}
}