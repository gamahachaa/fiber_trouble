package flow.all.fiberbox;

import flow.all.customer.IsSlowOrKaput;
import flow.nointernet.fiberbox.IsBoxReachable;
import flow.nointernet.so.IsTicketOpened;
import flow.tv.WhatIStheTVIssue;
import flow.vti._RXfromVTI;
import tstool.process.ActionRadios;
import tstool.process.Process;

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
		if(Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, No))
			this._nexts = [{step:IsBoxReachable}];
		else{
			this._nexts = [{step:_RXfromVTI}];
			/*var s = status.get(TITLE);
			if(s == ONE_OPENED)
				
			else
				this._nexts = [{step: _AdvicePutOpenSpace}];*/
		}
	}
	
	//inline function getNext():Class<Process>{
	//{
		//if (Main.HISTORY.isClassInteractionInHistory(Intro, No) && !(Main.HISTORY.isClassInteractionInHistory(WhatIStheTVIssue, Mid))
		//{
			///************************************
			 //* TV
			///************************************/
			////this._nexts = [ {step: WhatIStheTVIssue, params: []}];
			//this._nexts = [ {step: WhatIStheTVIssue, params: []}];
		//}
		//else if (Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, No))
		//{
			///***********************************
			 //* INTERNET
			///***********************************/
			//if (Main.customer.dataSet.get(CheckContractorVTI.CUST_DATA_PRODUCT).get(CheckContractorVTI.CUST_DATA_PRODUCT_BOX) == Std.string(Gigabox))
			//{
				///****
				 //* GIGABOX
				 //* */
				 //this._nexts = [ {step: CustomerInstruction, params: [
													//{step: _CreateTicketModemCNX},
													//{step: _CreateTicketModemCNX}
												//]}];
			//}
			//else // FIBER BOXES
				//this._nexts = [ {step: IsBoxReachable, params: []}];
		//}
		//else if (Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, Yes) || Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, Mid))
		//{
//
			//if (Main.HISTORY.isClassInteractionInHistory(LanOrWiFi, No))
			//{
				//this._nexts = [ {step: _TestSpeed, params: []}];
				//
			//}
			//else
			//{
				//this._nexts = [ {step:HaveRepeater}];
			//}
		//}
		//else
			//this._nexts = [{step: _TestSpeed, params: []}];
//
		////super.onNoClick();
	//}
}