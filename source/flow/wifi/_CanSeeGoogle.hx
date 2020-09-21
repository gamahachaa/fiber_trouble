package flow.wifi;

import flow.lan._CreateLanIssueTicket;
import tstool.process.Descision;
import tstool.process.Triplet;
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
				ereg: new EReg("^1[0-9]{7}$","i"),
				input:{
					width:400,
					prefix:"URL(s) not working",
					position:[bottom, left]
				}
			}
			]);
		}
	override public function create()
	{

		this._nextMidProcesses = this._nextNoProcesses = [new _CreateTicketWifiIssue()];
		this._nextYesProcesses = [ new _ConteactDeviceSupport() ];
		
		super.create();
	}
	override public function onMidClick():Void
	{
		if (validateMid())
		{
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
}