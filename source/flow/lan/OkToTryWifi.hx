package flow.lan;

import flow.wifi.WifiOnInDashboard;
import tstool.process.Descision;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class OkToTryWifi extends Triplet 
{

	override public function create()
	{
		this._nextNoProcesses = [new _CreateLanIssueTicket()];
		this._nextYesProcesses = [ new _CreateLanIssueTicket()];
		this._nextMidProcesses = [ new _CreateLanIssueTicket()];
		super.create();
	}
	
}