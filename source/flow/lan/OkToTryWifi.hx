package flow.lan;

import flow.wifi.WifiOnInDashboard;
import tstool.process.Descision;
import tstool.process.Process;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class OkToTryWifi extends Triplet 
{

	override public function create()
	{
		var n:Array<Process> = [new _CreateLanIssueTicket()];
		this._nextNoProcesses = n;
		this._nextYesProcesses = n;
		this._nextMidProcesses = n;
		super.create();
	}
	
}