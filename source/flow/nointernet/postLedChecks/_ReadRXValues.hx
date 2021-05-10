package flow.nointernet.postLedChecks;

//import flow.nointernet.customer.FiberCableChanged;
import flow.nointernet.customer.FiberCableChanged;
import flow.nointernet.so._CreateTicketModemCNX;
import flow.nointernet.so.tckets._SwapBox;
import flow.stability._CreateSOTechModemSpeed;
import tstool.process.TripletMultipleInput;

/**
 * @todo ARCHIVE
 */
class _ReadRXValues extends TripletMultipleInput
{
	/*
	public function new() 
	{
		super([{
			ereg:new EReg("(^-[0-9]{1,2}((,|.)[0-9]{1,3})?$)|(^aaa$)", "i"),
			input:{
				width:100,
				prefix:"RX",
				debug:"-12",
				position:[bottom, left]
			}
		}]);
	}
	override public function create():Void
	{
		if (Main.HISTORY.isInHistory("flow.all.customer.IsSlowOrKaput", Yes) || Main.HISTORY.isInHistory("flow.all.customer.IsSlowOrKaput", Mid)) // Stability
		{
			this._nextYesProcesses = [new _CreateSOTechModemSpeed()];
		}
		else{
			this._nextYesProcesses = [new _CreateTicketModemCNX()];
		}
		this._nextNoProcesses = [new _SwapBox()];
		this._nextMidProcesses = [new _SwapBox()];
		super.create();
	}
	override public function onYesClick()
	{
		#if debug
		trace(this.multipleInputs.inputs.get("RX").getInputedText());
		trace(Std.parseFloat(this.multipleInputs.inputs.get("RX").getInputedText()));
		#end
		var rxString = this.multipleInputs.inputs.get("RX").getInputedText();
		var rxFloat= Std.parseFloat(rxString);
		
		if (rxString == "aaa" || rxFloat < -20.99)
		{
			this._nextYesProcesses = [new FiberCableChanged()];
		}
		super.onYesClick();
	}
	*/
}