package flow.stability;

import flow.salttv._QuitAndRelaunchSaltTV;
import flow.wifi._ConnectWiFIToFiveGH;
import tstool.layout.History.Snapshot;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HasWifiDevice extends Descision 
{

	override public function create()
	{
		var previous:Snapshot = Main.HISTORY.getLast();
		
		switch (previous.processName)
		{
			case "flow.stability.HasLANDevice" :
				// no lan no wifi
				if(Main.HISTORY.isInHistory("flow.salttv.IsImageJerky", Yes))
					this._nextNoProcesses = [new _QuitAndRelaunchSaltTV()]; 
				else
					this._nextNoProcesses = [new IsAnyServiceImpactedForNormalUse()]; 
			case "flow.stability._SelectSaltServer" :
				if(previous.values.get("download")<80)
					this._nextNoProcesses = [new _BadOutstandingFlows()]; //Lan test made only bad dl values
				else{
					this._nextNoProcesses = [new _CNXallGooodMan() ]; //Lan test made only bad dl values
				}
		}
		
		this._nextYesProcesses = [new _ConnectWiFIToFiveGH()];
		super.create();
	}
	
}