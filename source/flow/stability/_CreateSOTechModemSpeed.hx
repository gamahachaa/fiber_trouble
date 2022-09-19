package flow.stability;

//import flow._AddMemoVti;
//import process.ActionMailNointernet;
//import tstool.process.ActionTicket;
//import tstool.process.ActionMail;
import flow.all.fiberbox._AdvicePutOpenSpace;
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
	override public function onClick():Void
	{
		//this._nexts = [{step: _AddMemoVti, params: []}];
		this._nexts = [{step: _SendSpeedTemplate, params: []}];
		super.onClick();
	}
}