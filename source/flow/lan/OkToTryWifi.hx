package flow.lan;

//import flow.wifi.WifiOnInDashboard;
//import tstool.process.Descision;   q
//import tstool.process.Process;
import flow.tickets.CustomerInstruction;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class OkToTryWifi extends Triplet 
{
	override public function onYesClick():Void
	{
		//this._nexts = [{step: _CreateLanIssueTicket, params: []}];
		this._nexts = [{step: CustomerInstruction, params: [{step: _CreateLanIssueTicket}, {step: _CreateLanIssueTicket}]}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: CustomerInstruction, params: [{step: _CreateLanIssueTicket}, {step: _CreateLanIssueTicket}]}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: CustomerInstruction, params: [{step: _CreateLanIssueTicket}, {step: _CreateLanIssueTicket}]}];
		super.onMidClick();
	}
}