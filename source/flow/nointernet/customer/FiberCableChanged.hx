package flow.nointernet.customer;

import flow.installation.IsOTOidAligned;
import flow.nointernet.so._CreateTicketModemCNX;
//import flow.installation.OTOPlugDamagedNotClicking;
//import flow.nointernet.postLedChecks._ReadRXValues;
//import flow.nointernet.so._CreateTicketModemCNX;
//import flow.stability._CreateSOTechModemSpeed;
//import tstool.process.DescisionMultipleInput;
import tstool.process.TripletMultipleInput;
//import flow.nointernet.so._CreateTicketModemCNX;
import flow.swapcable.SwapFiberCable;
//import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
//class FiberCableChanged extends DescisionMultipleInput
class FiberCableChanged extends TripletMultipleInput
{
	public function new() 
		{
			//super(280, "Store");
			super([
			{
				ereg: new EReg("^1[0-9]{7}$","i"),
				input:{
					width:200,
					prefix:"SO 5.2.6 ticket ID",
					position:[bottom, left]
				}
			}
			]);
		}
	override public function create():Void
	{
		//this._titleTxt = "Le câble Fiber a été changé ?";
		//this._detailTxt = "";
		//this._illustration = "";
		//this._nextYesProcesses = [new _ReadRXValues()];
		/*if (Main.HISTORY.isInHistory("flow.all.customer.IsSlowOrKaput", Yes) || Main.HISTORY.isInHistory("flow.all.customer.IsSlowOrKaput", Mid)) // Stability
		{
			this._nextMidProcesses = this._nextYesProcesses = [new _CreateSOTechModemSpeed()];
		}
		else{
			this._nextMidProcesses = this._nextYesProcesses = [new _CreateTicketModemCNX()];
			
		}*/
		/*****************************************
		 * INSTALLATION
		/*****************************************/
		this._nextMidProcesses = this._nextYesProcesses = [new _CreateTicketModemCNX()];
		/*****************************************
		 * SWAP CABLE
		/*****************************************/
		this._nextNoProcesses = [new IsOTOidAligned()];
		//this._nextNoProcesses = [new FiberCableIsSalt()];SwapFiberCable
		super.create();
	}
	override public function onYesClick():Void
	{
		if (validateYes())
		{
			super.onYesClick();
		}
	}
	override public function validateNo():Bool
	{
		return true;
	}
	override public function validateMid():Bool
	{
		return true;
	}
}