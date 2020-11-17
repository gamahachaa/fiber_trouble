package flow.nointernet.customer;

import flow.installation.IsOTOidAligned;
import flow.nointernet.fiberbox.BoxLedStatus;
import flow.nointernet.fiberbox._RebootBox;
import flow.nointernet.so._CreateTicketModemCNX;
import tstool.layout.History.Interactions;
import tstool.process.TripletMultipleInput;

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
					prefix:"SO swap cable ticket ID",
					debug:"11234567",
					position:[bottom, left]
				}
			}
			]);
		}
	override public function create():Void
	{
		/*****************************************
		 * INSTALLATION
		/*****************************************/
		//this._nextMidProcesses = this._nextYesProcesses = [new _CreateTicketModemCNX()];
		var nextafterreboot = new BoxLedStatus();
		this._nextMidProcesses = this._nextYesProcesses = [new _RebootBox(nextafterreboot,nextafterreboot)];
		//this._nextMidProcesses = this._nextYesProcesses = [new _RebootBox()];
		
		/*****************************************
		 * SWAP CABLE
		/*****************************************/
		this._nextNoProcesses = [new IsOTOidAligned()];
		//this._nextNoProcesses = [new FiberCableIsSalt()];SwapFiberCable
		super.create();
	}
	override function pushToHistory( buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>= null)
	{
		var ticket = multipleInputs.inputs.get("SO swap cable ticket ID").getInputedText() ;
		super.pushToHistory( buttonTxt, interactionType, ["SO swap cable ticket ID" => "<a target='_blank' href='http://cs.salt.ch/scripts/ticket.fcgi?_sf=0&action=doScreenDefinition&idString=viewEmail&entryId=" +ticket +"'>"+ticket+"</a>"]);
	}
	override public function onYesClick():Void
	{
		if (validateYes())
		{
			super.onYesClick();
		}
		else multipleInputs.inputs.get("SO swap cable ticket ID").blink(true);
	}
	override public function onMidClick():Void
	{
		if (validateMid())
		{
			super.onMidClick();
		}
		else multipleInputs.inputs.get("SO swap cable ticket ID").blink(true);
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
		return switch (multipleInputs.inputs.get("SO swap cable ticket ID").getInputedText())
		{
			case "11111111" : false;
			case (Std.parseInt(_) > 10755654 && Std.parseInt(_) < 12999999) => true : true;
			case _ : false;
		}
	}
}