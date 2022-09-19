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
				ereg: new EReg("^(1[3-9]{1}[0-9]{6}|9999)$","i"),
				input:{
					width:200,
					prefix:SO_TICKET_NUM,
					debug:"13345678",
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
			var r = new EReg("^(1[3-9]{1}[0-9]{6}|9999)$", "i");
			trace(r.match("9999"));
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
		return super.validateMid() && checkCheaters(true);
	}
	override function pushToHistory(buttonTxt:String, interactionType:Interactions, ?values:Map<String, Dynamic> = null) 
	{
		super.pushToHistory(buttonTxt, interactionType, [SO_TICKET_NUM => StringUtils.buildSOLink(multipleInputs.inputs.get(SO_TICKET_NUM).getInputedText())]);
	}
	function checkCheaters(store:Bool=false)
	{
		/**
		 * @todo Parse real tickets extract from SO
		 */
		return switch (multipleInputs.inputs.get(SO_TICKET_NUM).getInputedText())
		{
			#if debug
			case "12345678" : true;
			#end 
			case "11111111" : false;
			case (Std.parseInt(_) > 13755654 && Std.parseInt(_) < 19999999) => true : true;
			case "9999" : store && true;
			case _ : false;
		}
	}
}