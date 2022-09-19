package flow.wifi;

//import flow.lan._CreateLanIssueTicket;
import flow.tickets.CustomerInstruction;
import flow.wifi._CreateTicketWifiIssue;
import flow.all.fiberbox._LoopResetFiberBox;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class WifiVisibleByAppleTV extends Descision
{

	/*override public function create():Void
	{

		this._nextYesProcesses = [new WifiVisibleOnDevice()];
		var resetDone = Main.HISTORY.isInHistory("flow.all.fiberbox._LoopResetFiberBox", Yes);
		if (resetDone )
		{
			this._nextNoProcesses = [new _CreateTicketWifiIssue()];
		}
		else{
			var wva = new WifiVisibleOnDevice();
			this._nextNoProcesses = [new _LoopResetFiberBox(wva, wva)];
		}
		
		super.create();
	}*/
	override public function onYesClick():Void
	{
		//this._nextYesProcesses = [new ErrorIconOnWifiIcon()];
		this._nexts = [{step:WifiVisibleOnDevice}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		if ( Main.HISTORY.isClassInteractionInHistory(_LoopResetFiberBox,Yes) )
		{
			//this._nexts = [{step: _CreateTicketWifiIssue}];
			this._nexts = [{step: CustomerInstruction, params: [{step: _CreateTicketWifiIssue},{step: _CreateTicketWifiIssue}]}];
		}
		else{
			//var wva = new WifiVisibleOnDevice();
			//this._nextNoProcesses = [new _LoopResetFiberBox(wva, wva)];
			this._nexts = [{
				step: _LoopResetFiberBox,
				params:[
					{step:WifiVisibleOnDevice}, 
					{step:WifiVisibleOnDevice}]
			}];
		}
		super.onNoClick();
	}
}