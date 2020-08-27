package flow;

import flow.all.customer.IsSlowOrKaput;
import flow.all.customer.WhithWhichDevice;
import flow.nointernet.vti.CheckContractorVTI;
import js.Browser;
import openfl.Assets;
import tstool.process.CheckUpdateSub;
import tstool.process.Process;
import tstool.process.TicketSendSub;
import tstool.process.Triplet;
import tstool.utils.Csv;


class Intro extends Triplet
{
	override public function create():Void
	{
		
		Process.INIT();
		//trace(Main.user.isAdmin);
		
		//trace("WTF"); 
		var next = new CheckContractorVTI();
		//this._nextYesProcesses = [new IsSlowOrKaput()];
		this._nextYesProcesses = [new WhithWhichDevice()];
		this._nextNoProcesses = [ next ];
		this._nextMidProcesses = [ next ];
		
 		super.create();
		#if !debug
		Main.VERSION_TRACKER.scriptChangedSignal.add(onNewVersion);
		Main.VERSION_TRACKER.request();
		openSubState(new CheckUpdateSub(Main.THEME.bg));
		#end
			
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