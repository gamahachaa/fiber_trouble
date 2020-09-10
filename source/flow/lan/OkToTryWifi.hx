package flow.lan;

import flow.wifi.WifiOnInDashboard;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class OkToTryWifi extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _CreateLanIssueTicket()];
		this._nextYesProcesses = [ new WifiOnInDashboard()];
		super.create();
	}
	
}