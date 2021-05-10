package flow.nointernet.so.tckets;

import flow.all.customer._SendTechMail;
import process.ActionMailNointernet;
//import tstool.process.ActionMail;
import tstool.salt.SOTickets;
class _WrongOTO extends ActionMailNointernet
{
	public function new() 
	{
		//super("5.1.1 :: Technical - Optical connection / OTO - Wrong OTO connected", Main.TECH_HIGH);
		super(SOTickets.FIX_511);
	}
	
	override public function onClick():Void
	{
		this._nexts = [{step: _SendTechMail, params: []}];
		super.onClick();
	}
}