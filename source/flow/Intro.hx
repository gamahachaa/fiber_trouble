package flow;

import flow.all.customer._ExplainMainSteps;
import flow.all.customer.IsSlowOrKaput;
import tstool.layout.UI;
import tstool.process.CheckUpdateSub;
//import tstool.layout.UI;
//import tstool.process.CheckUpdateSub;
import tstool.process.Process;

import js.Browser;
import tstool.process.Triplet;
//import tstool.utils.Csv;


class Intro extends Triplet
{
	override public function create():Void
	{
		Process.INIT();
		
 		super.create();
		//#if !debug
		Main.VERSION_TRACKER.scriptChangedSignal.add(onNewVersion);
		
		#if debug
		if (Main.DEBUG){
			trace("Main.DEBUG OPEN ROBOT");
			//openSubState(new CheckUpdateSub(UI.THEME.bg));
		}
		else{
			trace("LOCAL.DEBUG does not OPEN ROBOT");
		}
		
		#else
		//trace("PROD does OPEN ROBOT");
		Main.VERSION_TRACKER.request();
		openSubState(new CheckUpdateSub(UI.THEME.bg));
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
		
		this._nexts = [{step:IsSlowOrKaput}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step:_ExplainMainSteps}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step:_ExplainMainSteps}];
		super.onMidClick();
	}
}