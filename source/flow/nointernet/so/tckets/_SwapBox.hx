package flow.nointernet.so.tckets;

import flow.End;
import process.ActionMailNointernet;
//import flow.nointernet.vti.CheckContractorVTI;
//import tstool.process.ActionMail;
import tstool.salt.SOTickets;

class _SwapBox extends ActionMailNointernet {
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