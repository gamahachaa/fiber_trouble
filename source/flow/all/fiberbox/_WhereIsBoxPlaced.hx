package flow.all.fiberbox;

import flow.all.customer.IsSlowOrKaput;
import flow.nointernet.fiberbox.IsBoxReachable;
import flow.nointernet.vti.CheckContractorVTI;
import flow.phone.HowIsDeviceConnected;
import flow.phone.IsTheDeviceWorking;
import flow.phone.WhatIsthePhoneISsue;
import flow.vti.SerialVTI;

import flow.vti._RXfromVTI;
import tstool.process.ActionRadios;

/**
 * ...
 * @author bb
 */
class _WhereIsBoxPlaced extends ActionRadios
{

	public static inline var TITLE:String = "Placement";
	public static inline var ONE_OPENED:String = "Open space";
	public static inline var TWO_CLOSED:String = "Closed space";
	public static inline var TREE_MULTIMEDIA:String = "Multimedia";

	public function new()
	{
		super([
		{
			title: TITLE,
			hasTranslation:true,
			values: [ONE_OPENED, TWO_CLOSED, TREE_MULTIMEDIA]
		}
		]);

	}
	
	override public function onClick():Void
	{
		//this._nexts = [{step:  getNext(), params: []}];
		
		if (validate()){
			getNext();
			super.onClick();
		}
	}
	function getNext():Void
	{
		var mainIssue = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		var phoneIssue = Main.HISTORY.findValueOfFirstClassInHistory(WhatIsthePhoneISsue, WhatIsthePhoneISsue.ISSUE);
		if(Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, No))
			this._nexts = [{step:IsBoxReachable}];
		else if (mainIssue.value == Intro.phone )
		{
			if (phoneIssue.value == WhatIsthePhoneISsue.drop_calls)
			{
				this._nexts = [{step:IsTheDeviceWorking}];
			}
			else if (phoneIssue.value == WhatIsthePhoneISsue.caller_id || phoneIssue.value == WhatIsthePhoneISsue.sound_quality)
			{
				this._nexts = [{step: HowIsDeviceConnected}];
			} 
			//else (phoneIssue.value == WhatIsthePhoneISsue.no_calls)
			else
			{
				this._nexts = [{step:IsBoxReachable}];
			}
			//else
			//{
				//this._nexts = [{step:SerialVTI}];
			//}
			
			
		}
		else{
			if(chekcIfArcadyan())
				this._nexts = [{step:SerialVTI}];
			else
				this._nexts = [{step:_RXfromVTI}];
		}
	}
	inline function chekcIfArcadyan()
	{
		if (Main.customer.dataSet != null)
		{
			if (Main.customer.dataSet.exists(CheckContractorVTI.CUST_DATA_PRODUCT))
			{
				if (Main.customer.dataSet.get(CheckContractorVTI.CUST_DATA_PRODUCT).exists(CheckContractorVTI.CUST_DATA_PRODUCT_BOX))
				{
					return Main.customer.dataSet.get(CheckContractorVTI.CUST_DATA_PRODUCT).get(CheckContractorVTI.CUST_DATA_PRODUCT_BOX) == CheckContractorVTI.ARCADYAN;
				}
				else return false;
			}
			else return false;
		}
		else return false;
	}
	
}