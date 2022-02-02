package flow.wifi;

import flow.all.fiberbox._LoopResetFiberBox;
import flow.tickets.CustomerInstruction;
//import flow.lan._CreateLanIssueTicket;
import flow.wifi._SwitchOnUsingButton;
import flow.wifi.CanConnectToBoxWithLAN;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class WifiOnInDashboard extends Descision 
{
	/**
	 * @todo IMPORTANT VERIFY branching //this._nextYesProcesses = [new ErrorIconOnWifiIcon()];
	 */
	
	override public function onYesClick():Void
	{
		//this._nextYesProcesses = [new ErrorIconOnWifiIcon()];
		//this._nexts = [{step:ErrorIconOnWifiIcon}];
		this._nexts = [{
				step: _MoveCloseUnplugRepeater,
				params:[
					{step:WifiVisibleOnDevice}, 
					{step:WifiVisibleOnDevice}]
			}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [
			{step: _SwitchOnUsingButton}, 
			//Main.HISTORY.isClassInHistory(_LoopResetFiberBox) ?  {step: _CreateTicketWifiIssue}: {step: _LoopResetFiberBox}, 
			Main.HISTORY.isClassInHistory(_LoopResetFiberBox) ?  {step: CustomerInstruction, params: [{step: _CreateTicketWifiIssue},{step: _CreateTicketWifiIssue}]}: {step: _LoopResetFiberBox}, 
			{step:CanConnectToBoxWithLAN}
		];
		//this._nextNoProcesses = [];
		super.onNoClick();
	}
}