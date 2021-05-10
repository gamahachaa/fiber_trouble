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
		Main.VERSION_TRACKER.request();
		#if debug
		trace("Showing the new version if any");
		#else
		openSubState(new CheckUpdateSub(UI.THEME.bg));
		#end
		ui.showHowto(true);
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