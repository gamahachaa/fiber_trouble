package flow;

import flow.all.customer.IsSlowOrKaput;
import flow.nointernet.vti.CheckContractorVTI;
import js.Browser;
import process.CheckUpdateSub;
import process.Process;
import process.TicketSendSub;
import process.Triplet;


class Intro extends Triplet
{
	override public function create():Void
	{
		
		Process.INIT();
		
		//trace("WTF"); 
		var next = new CheckContractorVTI();
		this._nextYesProcesses = [new IsSlowOrKaput()];
		this._nextNoProcesses = [ next ];
		this._nextMidProcesses = [ next ];
		Main.VERSION_TRACKER.scriptChangedSignal.add(onNewVersion);
		
 		super.create();
		
		Main.VERSION_TRACKER.request();
		openSubState(new CheckUpdateSub(Main.THEME.bg));
		
	}
	
	function onNewVersion(needsUpdate:Bool):Void 
	{
		if (needsUpdate)
		{
			Browser.location.reload(true);
		}
		else{
			closeSubState();
		}
	}
	
	
}