package flow.stability;

//import flow._AddMemoVti;
//import process.ActionMailNointernet;
//import tstool.process.ActionTicket;
//import tstool.process.ActionMail;
import flow.all.fiberbox._AdvicePutOpenSpace;
import tstool.MainApp;
import tstool.salt.SOTickets;
/**
 * ...
 * @author bb
 */
class _CreateSOTechModemSpeed extends TechTickets 
{
	public function new() 
	{
		super(SOTickets.FIX_525, Main.HISTORY.isClassInHistory(_AdvicePutOpenSpace));
		
	}
	override public function create() 
	{
		
		if (isBoxInColsedSpace())
		{
			
			this._detailTxt = StringTools.replace (this._detailTxt , "] ",  "] RESOLVED ");
			this._titleTxt = StringTools.replace (this._titleTxt, " [",  " RESOLVED [");
		}
		super.create();
	}
	override public function onClick():Void
	{
		//this._nexts = [{step: _AddMemoVti, params: []}];
		this._nexts = [{step: _SendSpeedTemplate, params: []}];
		super.onClick();
	}
	function isBoxInColsedSpace():Bool
	{
		return Main.HISTORY.isClassInHistory(flow.all.fiberbox._AdvicePutOpenSpace);
	}
}