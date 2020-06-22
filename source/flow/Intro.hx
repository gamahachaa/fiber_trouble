package flow;

import flow.all.customer.IsSlowOrKaput;
import flow.nointernet.vti.CheckContractorVTI;
import js.Browser;
import openfl.Assets;
import process.CheckUpdateSub;
import process.Process;
import process.TicketSendSub;
import process.Triplet;
import utils.Csv;


class Intro extends Triplet
{
	override public function create():Void
	{
		
		Process.INIT();
		//trace(Main.user.isAdmin);
		
		//trace("WTF"); 
		var next = new CheckContractorVTI();
		this._nextYesProcesses = [new IsSlowOrKaput()];
		this._nextNoProcesses = [ next ];
		this._nextMidProcesses = [ next ];
		
		
 		super.create();
		//details.tf.htmlText = "<h1>YA</h1><b>yo</b><br/><a>yiiii</a>";
		//#if !debug
		Main.VERSION_TRACKER.scriptChangedSignal.add(onNewVersion);
		Main.VERSION_TRACKER.request();
		openSubState(new CheckUpdateSub(Main.THEME.bg));
		//#end
			
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