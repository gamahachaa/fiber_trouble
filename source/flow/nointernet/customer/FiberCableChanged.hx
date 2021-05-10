package flow.nointernet.customer;

import flow.installation.IsOTOidAligned;
import flow.installation._EnsureCorrectPortPlug;
import flow.nointernet.fiberbox.BoxLedStatus;
import flow.nointernet.fiberbox._RebootBox;
import flow.nointernet.so._CreateTicketModemCNX;
import tstool.layout.History.Interactions;
import tstool.process.Process;
import tstool.process.TripletMultipleInput;

/**
 * ...
 * @author ...
 */
//class FiberCableChanged extends DescisionMultipleInput
class FiberCableChanged extends TripletMultipleInput
{
	public static inline var SO_TICKET_NUM = "SO swap cable ticket ID";
	public function new() 
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
	override function pushToHistory( buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>= null)
	{
		var ticket = multipleInputs.inputs.get(SO_TICKET_NUM).getInputedText() ;
		ticket = StringTools.trim(ticket) == ""?"":"<a target='_blank' href='http://cs.salt.ch/scripts/ticket.fcgi?_sf=0&action=doScreenDefinition&idString=viewEmail&entryId=" + ticket +"'>" + ticket + "</a>";
		super.pushToHistory( buttonTxt, interactionType, [SO_TICKET_NUM => ticket]);
	}
	override public function onYesClick():Void
	{
		if (validateYes())
		{
			//this._nexts = [{step: _RebootBox, params: [{step: BoxLedStatus},{step: BoxLedStatus}]}];
			this._nexts = [{step: _EnsureCorrectPortPlug}];
			super.onYesClick();
		}
		else multipleInputs.inputs.get(SO_TICKET_NUM).blink(true);
	}
	override public function onMidClick():Void
	{
		if (validateMid())
		{
			//this._nexts = [{step: _RebootBox, params: [{step: BoxLedStatus},{step: BoxLedStatus}]}];
			this._nexts = [{step: _EnsureCorrectPortPlug}];
			super.onMidClick();
		}
		else multipleInputs.inputs.get(SO_TICKET_NUM).blink(true);
	}
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsOTOidAligned, params: []}];
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
			case (Std.parseInt(_) > 10755654 && Std.parseInt(_) < 12999999) => true : true;
			case _ : false;
		}
	}
}