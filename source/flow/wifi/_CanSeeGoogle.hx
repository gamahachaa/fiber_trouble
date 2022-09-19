package flow.wifi;

//import flow.lan._CreateLanIssueTicket;
import flow.tickets.CustomerInstruction;
//import tstool.process.Descision;
//import tstool.process.Triplet;
import tstool.process.TripletMultipleInput;

/**
 * ...
 * @author bb
 */
class _CanSeeGoogle extends TripletMultipleInput 
{
	public function new() 
	{
		//super(280, "Store");
		super([
		{
			ereg: new EReg("^((https|ftp|file)(://))?[A-Za-z0-9+&@#/%?=~_|!:,.;-]*[A-Za-z0-9+&@#/%=~_|-]$","i"),
			input:{
				width:400,
				prefix:"URL(s) not working",
				debug:"https://zoomquilt.org/",
				position:[bottom, left]
			}
		}
		]);
	}
	
	override public function onMidClick():Void
	{
		if (validateMid())
		{
			//this._nexts = [{step: _CreateTicketWifiIssue, params: []}];
			this._nexts = [{step: CustomerInstruction, params: [{step: _CreateTicketWifiIssue},{step: _CreateTicketWifiIssue}]}];
			super.onMidClick();
		}
	}
	override public function validateNo():Bool
	{
		return true;
	}
	override public function validateYes():Bool
	{
		return true;
	}
	
	
	override public function onYesClick():Void
	{
		this._nexts = [{step: _ConteactDeviceSupport, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		//this._nexts = [{step: _CreateTicketWifiIssue, params: []}];
		this._nexts = [{step: CustomerInstruction, params: [{step: _CreateTicketWifiIssue},{step: _CreateTicketWifiIssue}]}];
		super.onNoClick();
	}
	
}