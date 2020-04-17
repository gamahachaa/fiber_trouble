package flow.wifi;

import flow.lan.ConnectedViaSwitch;
import process.Descision;

/**
 * ...
 * @author bb
 */
class WhyCannotConnectWithLan extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new ConnectedViaSwitch()];
		this._nextYesProcesses = [new _CreateTicketWifiIssue()];
		super.create();
	}
	
}