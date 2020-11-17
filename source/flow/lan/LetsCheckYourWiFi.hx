package flow.lan;

import flow._AddMemoVti;
import flow.wifi.WifiOnInDashboard;
import tstool.process.Action;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class LetsCheckYourWiFi extends Descision 
{

	override public function create()
	{
		this._nextYesProcesses = [new _AddMemoVti()];
		this._nextNoProcesses = [new WifiOnInDashboard()];
		super.create();
	}
}