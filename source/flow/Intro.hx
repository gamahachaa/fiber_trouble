package flow;

import flow.all.customer._ExplainMainSteps;
import flow.all.customer.IsSlowOrKaput;
import flow.phone.WhatIsthePhoneISsue;
import flow.tv.WhatIStheTVIssue;
import tstool.utils.VTIdataParser;
//import haxe.Exception;
import tstool.MainApp;
//import tstool.layout.History.Snapshot;
//import tstool.layout.UI;
import tstool.process.ActionRadios;
//import tstool.process.CheckUpdateSub;
//import tstool.layout.UI;
//import tstool.process.CheckUpdateSub;
import tstool.process.Process;

import js.Browser;
//import tstool.process.Triplet;
//import tstool.utils.Csv;


//class Intro extends Triplet
class Intro extends ActionRadios
{
	public static inline var ISSUE:String = "ISSUE";
	public static inline var internet:String = "internet";
	public static inline var tv:String = "tv";
	public static inline var order:String = "order";
	public static inline var phone:String = "phone";
	public function new() 
	{
		super(
		[
			{
				title: ISSUE,
				hasTranslation:true,
				values: [internet, tv, phone, order]
			}
		]
		);
		
	}
	
	override public function onClick():Void
	{
		if (validate())
		{
			this._nexts = [{step: getNext(), params: []}];
			super.onClick();
		}
	}
	inline function getNext():Class<Process>{
		var issue:String = status.get(ISSUE);
		return  switch (status.get(ISSUE))
		{
			case Intro.tv: WhatIStheTVIssue;
			case Intro.phone: WhatIsthePhoneISsue;
			case Intro.order: _ExplainMainSteps;
			case _: IsSlowOrKaput; 
				
		}
	}

	override public function create():Void
	{
		Process.INIT();
		
 		super.create();
		
		//#if !debug
		//var issue:Snapshot = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		
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
		try{
			Main.VERSION_TRACKER.scriptChangedSignal.add(onNewVersion);
			Main.VERSION_TRACKER.request();
		}
		catch (e:Exception)
		{
			trace(e);
		}
		
		Main.trackH.reset(false);
		Main.trackH.setDefaultContext(MainApp.translator.locale, "fiber.tech.qtool@salt.ch");
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
			MainApp.VERSION_TIMER_value = MainApp.VERSION_TIMER_DURATION;
		}
	}
	/*
	override public function onYesClick():Void
	{
		
		this._nexts = [{step:IsSlowOrKaput}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: WhatIStheTVIssue}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step:_ExplainMainSteps}];
		super.onMidClick();
	}*/
}