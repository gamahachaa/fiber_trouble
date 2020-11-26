package flow.lan;

import flow.wifi._CreateTicketWifiIssue;
import tstool.process.Action;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class _TestWithAnotherLanDevice extends Descision 
{

	override public function create()
	{
		this._nextYesProcesses = [new LanConnectionOK()];
		/**
		 * @todo String to Class<Process> / isInHistory
		 */

		if (Main.HISTORY.isInHistory("flow.wifi.CanConnectToBoxWithLAN", Yes) || Main.HISTORY.isInHistory("flow.wifi.CanConnectToBoxWithLAN", No) && Main.HISTORY.isInHistory("flow.all.customer.LanOrWiFi", Yes))
		{
			
				/******************************************
				 * WiFi Not visible on Dashboard WiFi issue
				/*****************************************/
				this._nextNoProcesses = [new _CreateTicketWifiIssue()];
		}
		else
			this._nextNoProcesses = [new OkToTryWifi()];
		super.create();
	}
	
}