package flow.nointernet.customer;

import flow.installation.IsOTOidAligned;
import flow.installation._EnsureCorrectPortPlug;
import tstool.process.Process;
//import flow.nointernet.fiberbox.BoxLedStatus;
//import flow.nointernet.fiberbox._RebootBox;
//import flow.nointernet.so._CreateTicketModemCNX;
import tstool.layout.History.Interactions;
//import tstool.process.Process;
import tstool.process.TripletMultipleInput;
using string.StringUtils;

/**
 * @todo Make it loopable (hence put the constructor params in parent class)
 * ...
 * @author ...
 */
//class FiberCableChanged extends DescisionMultipleInput
class FiberCableChanged extends TripletMultipleInput
{
	var nYes:ProcessContructor;
	var nNo:ProcessContructor;
	var nMid:ProcessContructor;
	public static inline var SO_TICKET_NUM = "SO swap cable ticket ID";
	public function new(
		?nextYes:ProcessContructor,
		?nextNo:ProcessContructor,
		?nextMid:ProcessContructor
		) 
		{
			//super(280, "Store");
			super([
			{
				ereg: new EReg("^1[0-9]{7}$","i"),
				input:{
					width:200,
					prefix:SO_TICKET_NUM,
					debug:"11234567",
					position:[bottom, left]
				}
			}
			]);
			nYes =  {step: _EnsureCorrectPortPlug};
			nNo =  {step: IsOTOidAligned};
			nMid =  {step: _EnsureCorrectPortPlug};
			
			if ( nextYes != null ) nYes = nextYes;
			if ( nextNo != null ) nNo = nextNo;
			if ( nextMid != null ) nMid = nextMid;
			#if debug
			trace("flow.nointernet.customer.FiberCableChanged::FiberCableChanged::nYes ", nYes  );
	
			trace("flow.nointernet.customer.FiberCableChanged::FiberCableChanged::nNo", nNo );
			trace("flow.nointernet.customer.FiberCableChanged::FiberCableChanged::nMid", nMid );
			#end
		}
	//override public function create():Void
	//{
		///*****************************************
		 //* INSTALLATION
		///*****************************************/
		////this._nextMidProcesses = this._nextYesProcesses = [new _CreateTicketModemCNX()];
		////var nextafterreboot = new BoxLedStatus();
		//var nextafterreboot:ProcessContructor = {step:BoxLedStatus};
		//this._nextMidProcesses = this._nextYesProcesses = [new _RebootBox(nextafterreboot,nextafterreboot)];
		////this._nextMidProcesses = this._nextYesProcesses = [new _RebootBox()];
		//
		///*****************************************
		 //* SWAP CABLE
		///*****************************************/
		//this._nextNoProcesses = [new IsOTOidAligned()];
		////this._nextNoProcesses = [new FiberCableIsSalt()];SwapFiberCable
		//super.create();
	//}
	/*override function pushToHistory( buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>= null)
	{
		var ticket = StringTools.trim(multipleInputs.inputs.get(SO_TICKET_NUM).getInputedText())  ;
		ticket = ticket == ""?"": ticket.buildSOLink();
		
		super.pushToHistory( buttonTxt, interactionType, [SO_TICKET_NUM => ticket]);
	}*/
	override public function onYesClick():Void
	{
		if (validateYes())
		{
			//this._nexts = [{step: _RebootBox, params: [{step: BoxLedStatus},{step: BoxLedStatus}]}];
			this._nexts = [nYes == null ? Main.HISTORY.getPreviousClass() :nYes ];
			super.onYesClick();
		}
		else multipleInputs.inputs.get(SO_TICKET_NUM).blink(true);
	}
	override public function onMidClick():Void
	{
		if (validateMid())
		{
			//this._nexts = [{step: _RebootBox, params: [{step: BoxLedStatus},{step: BoxLedStatus}]}];
			this._nexts = [nMid == null ? Main.HISTORY.getPreviousClass() : nMid];
			super.onMidClick();
		}
		else multipleInputs.inputs.get(SO_TICKET_NUM).blink(true);
	}
	
	override public function onNoClick():Void
	{
		this._nexts = [nNo == null ? Main.HISTORY.getPreviousClass() :nNo];
		super.onNoClick();
	}
	override public function validateNo():Bool
	{
		return true;
	}
	override public function validateYes():Bool
	{
		return super.validateYes() && checkCheaters() ;
	}
	override public function validateMid():Bool
	{
		return super.validateMid() && checkCheaters();
	}
	function checkCheaters()
	{
		/**
		 * @todo Parse real tickets extract from SO
		 */
		return switch (multipleInputs.inputs.get(SO_TICKET_NUM).getInputedText())
		{
			case "11111111" : false;
			case (Std.parseInt(_) > 10755654 && Std.parseInt(_) < 19999999) => true : true;
			case _ : false;
		}
	}
}