package flow.wifi;

//import flow.lan._CreateLanIssueTicket;
import flow.tickets.CustomerInstruction;
import flow.wifi._CreateTicketWifiIssue;
//import flow.all.fiberbox._LoopResetFiberBox;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class ErrorIconOnWifiIcon extends Descision
{

	override public function onYesClick():Void
	{
		//this._nexts = [{step: _CreateTicketWifiIssue, params: []}];
		this._nexts = [{step: CustomerInstruction, params: [{step: _CreateTicketWifiIssue},{step: _CreateTicketWifiIssue}]}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _CanSeeGoogle, params: []}];
		super.onNoClick();
	}
}