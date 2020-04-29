package flow.nointernet.postLedChecks;

//import flow.nointernet.customer.FiberCableChanged;
import flow.nointernet.so._CreateTicketModemCNX;
import flow.nointernet.so.tckets._SwapBox;
import flow.stability._CreateSOTechModemSpeed;
//import process.ActionInput;
import process.TripletInput;


class _ReadRXValues extends TripletInput
{
	public function new() 
	{
		//super(100, "RX" , new EReg("(^-?[0-9,.]{1,6}$)|(^aaa$)","i"));
		super(100, "RX" , new EReg("(^-[0-9,.]{1,6}$)|(^aaa$)","i"));
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
	
}