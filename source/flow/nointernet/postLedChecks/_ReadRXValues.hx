package flow.nointernet.postLedChecks;

//import flow.nointernet.customer.FiberCableChanged;
import flow.nointernet.customer.FiberCableChanged;
import flow.nointernet.so._CreateTicketModemCNX;
import flow.nointernet.so.tckets._SwapBox;
import flow.stability._CreateSOTechModemSpeed;
import process.TripletMultipleInput;


class _ReadRXValues extends TripletMultipleInput
{
	public function new() 
	{
		//super(100, "RX" , new EReg("(^-?[0-9,.]{1,6}$)|(^aaa$)","i"));
		//super(100, "RX" , new EReg("(^-[0-9]{1,2}((,|.)[0-9]{1,3})?$)|(^aaa$)", "i"));
		super([{
			ereg:new EReg("(^-[0-9]{1,2}((,|.)[0-9]{1,3})?$)|(^aaa$)", "i"),
			input:{
				width:100,
				prefix:"RX",
				position:bottom
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
		//if (Std.parseFloat(this.singleInput.uiInput.inputtextfield.text) < -20.99)
		if (Std.parseFloat(this.multipleInputs.inputs.get("RX").getInputedText()) < -20.99)
		{
			this._nextYesProcesses = [new FiberCableChanged()];
		}
		super.onYesClick();
	}
}