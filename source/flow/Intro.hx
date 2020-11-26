package flow;

import flow.all.customer._ExplainMainSteps;
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
		var next = new _ExplainMainSteps();
		this._nextYesProcesses = [new IsSlowOrKaput()];
		//this._nextYesProcesses = [new WhithWhichDevice()];
		this._nextNoProcesses = [ next ];
		this._nextMidProcesses = [ next ];
		
 		super.create();
		//#if !debug
		Main.VERSION_TRACKER.scriptChangedSignal.add(onNewVersion);
		Main.VERSION_TRACKER.request();
		#if debug
		trace("Showing the new version if any");
		#else
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
	
	override public function onYesClick():Void
	{
		this._nextYesProcesses = [];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nextNoProcesses = [];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nextMidProcesses = [];
		super.onMidClick();
	}
}