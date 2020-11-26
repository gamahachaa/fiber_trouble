package flow.nointernet.customer;


import flow.lan.ConnectedViaSwitch;
import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
//import flow.salttv._InstallSpeedTestAplleTV;
//import flow.stability.HasAppleTV;
//import flow.stability._OpenSpeedTest;
import flow.wifi.WifiOnInDashboard;
import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _TellCustomerAllOkWithFiberCnx extends Action
{
	override public function create():Void
	{
		/**
		 * @todo String to Class<Process> / isInHistory
		 */
		if (Main.HISTORY.isInHistory("flow.Intro", No))//TV
		{
			this._nextProcesses = [new IsAppleTVvisibleOnTVScreen()];
		}
		else if (Main.HISTORY.isInHistory("flow.Intro", Yes))
		{
			//var h = Main.HISTORY.findStepsInHistory("flow.all.customer.WhithWhichDevice", 1, true);
			//if( h[0].values[0] == "mobile" || Main.HISTORY.isInHistory("flow.all.customer.LanOrWiFi", Yes) || )
			if (Main.HISTORY.isInHistory("flow.all.customer.LanOrWiFi", Yes))
			{
				//WiFI
				this._nextProcesses = [new WifiOnInDashboard()];
				
			}
			else{
				//LAN
				//this._nextProcesses = [new HasAppleTV()];
				this._nextProcesses = [new ConnectedViaSwitch()];
			}
			
				
		}
		super.create();
	}
}