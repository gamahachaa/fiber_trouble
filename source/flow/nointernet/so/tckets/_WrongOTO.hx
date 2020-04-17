package flow.nointernet.so.tckets;

import flow.all.customer._SendTechMail;
import process.ActionMail;
import salt.SOTickets;
class _WrongOTO extends ActionMail
{
	public function new() 
	{
		//super("5.1.1 :: Technical - Optical connection / OTO - Wrong OTO connected", Main.TECH_HIGH);
		super(SOTickets.FIX_511);
	}
	override public function create():Void
	{
		this._nextProcesses = [new _SendTechMail()];
		super.create();
	}
}