package flow.tv;

import flow._AddMemoVti;
import tstool.MainApp;
//import process.ActionMailNointernet;
//import tstool.process.ActionTicket;
//import tstool.process.ActionMail;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
//class _CreateSOTicketSaltTV extends TechTickets 
class _CreateSOTicketSaltTV extends ActionTicketFiberTrouble 
{

	public function new() 
	{
		super(SOTickets.FIX_541);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
	override public function create() 
	{
		
		
		if (isBoxInColsedSpace())
		{
			//this._detailTxt = MainApp.translator.translate("flow.all.fiberbox._AdvicePutOpenSpace","","TITLE");
			this._titleTxt = this._titleTxt + "\nRESOLVED";
		}
		super.create();
	}
	function isBoxInColsedSpace():Bool
	{
		return Main.HISTORY.isClassInHistory(flow.all.fiberbox._AdvicePutOpenSpace);
	}
}