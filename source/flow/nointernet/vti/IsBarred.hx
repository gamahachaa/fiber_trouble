package flow.nointernet.vti;

import flow.collection._VerifyCollectionStep;
import flow.lan.ConnectedViaSwitch;
import flow.phone.WasThereAnyCallFWD;
import flow.phone.WhatIsthePhoneISsue;
import flow.vti.CheckBalance;
import flow.wifi.WifiOnInDashboard;
import tstool.layout.History.ValueReturn;
import tstool.process.ActionRadios;
//import tstool.process.Descision;
import tstool.process.Process;
//import tstool.process.Triplet;

/**
 * ...
 * @author ...
 */
class IsBarred extends ActionRadios
{
	var isPhone:ValueReturn;
	public static inline var STATUS:String = "STATUS";
	public static inline var NO_BARRING:String = "Nobarrings";
	public static inline var CUSTOMER:String = "CustomerOperator";
	public static inline var FRAUD:String = "Fraud";
	public static inline var COLLECTION:String = "Collection";
	public function new() 
	{
		isPhone = Main.HISTORY.findValueOfFirstClassInHistory(WhatIsthePhoneISsue, WhatIsthePhoneISsue.ISSUE);
		#if debug
		trace("flow.nointernet.vti.IsBarred::IsBarred::isPhone", isPhone );
		#end
		var radioTabs:Array<String> = [NO_BARRING, COLLECTION];
		if ( isPhone.exists )
			radioTabs = [NO_BARRING, CUSTOMER, FRAUD, COLLECTION];
		super(
		[
			{
				title: STATUS,
				hasTranslation:true,
				values: radioTabs
			}
		]
		);
		
	}
	override public function onClick():Void
	{   if (validate())
		{
			this._nexts = [{step:  getNext(), params: []}];
			super.onClick();
		}
	}
	
	
	/*override public function onYesClick():Void
	{
		this._nexts = [{step: _VerifyCollectionStep, params: []}];
		super.onYesClick();
	}
	override public function onMidClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onMidClick();
	}
	override public function onNoClick():Void
	{
		
		this._nexts = [{step: getNext() , params: []}];
		super.onNoClick();
	}*/
	inline function getNext():Class<Process>
	{
		 
		 var status:String = status.get(STATUS);
		 var isBarred = status != NO_BARRING;
		return if (Main.HISTORY.isClassInteractionInHistory(flow.all.customer.LanOrWiFi, Yes))
		{
			isBarred ? _VerifyCollectionStep: WifiOnInDashboard;
		}
		else if (isPhone.exists)
		{
			if(status == FRAUD)
				CheckBalance;
			else if (status == COLLECTION)
				 _VerifyCollectionStep;
			else  WasThereAnyCallFWD;
		}
		else{
			isBarred ? _VerifyCollectionStep: ConnectedViaSwitch;
		}
	}
}