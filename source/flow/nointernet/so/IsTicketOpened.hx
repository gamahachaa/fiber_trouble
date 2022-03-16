package flow.nointernet.so;

import flow.all.customer.IsSlowOrKaput;
import flow.all.customer.LanOrWiFi;
import flow.nointernet.vti.CheckContractorVTI;
import flow.tickets.CustomerInstruction;
//import flow.all.customer.WhichBox;
//import flow.equipment.IsWhishDateWayAhead;
import flow.escalation.IsTechTicket;
import flow.nointernet.fiberbox.IsBoxReachable;
import flow.stability._TestSpeed;
//import flow.stability.atf.IsFWToTheLatest;
import flow.tv.WhatIStheTVIssue;
import flow.wifi.HaveRepeater;
//import flow.wifi._MoveCloseUnplugRepeater;
import tstool.process.Descision;
import flow.all.fiberbox.WhatBoxIsIt.Box;  // Enum needed

/**
 * ...
 * @author
 */
class IsTicketOpened extends Descision
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: IsTechTicket, params: []}];
		super.onYesClick();
	}
	//override public function onNoClick():Void
	//{
	//this._nexts = [{step: WhichBox, params: []}];
	//super.onNoClick();
	//}
	override public function onNoClick():Void
	{
		if (Main.HISTORY.isClassInteractionInHistory(Intro, No))
		{
			/************************************
			 * TV
			/************************************/
			this._nexts = [ {step: WhatIStheTVIssue, params: []}];
		}
		else if (Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, No))
		{
			/***********************************
			 * INTERNET
			/***********************************/
			if (Main.customer.dataSet.get(CheckContractorVTI.CUST_DATA_PRODUCT).get(CheckContractorVTI.CUST_DATA_PRODUCT_BOX) == Std.string(Gigabox))
			{
				/****
				 * GIGABOX
				 * */
				 this._nexts = [ {step: CustomerInstruction, params: [
													{step: _CreateTicketModemCNX},
													{step: _CreateTicketModemCNX}
												]}];
			}
			else // FIBER BOXES
				this._nexts = [ {step: IsBoxReachable, params: []}];
		}
		else if (Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, Yes) || Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, Mid))
		{

			if (Main.HISTORY.isClassInteractionInHistory(LanOrWiFi, No))
			{
				this._nexts = [ {step: _TestSpeed, params: []}];
			}
			else
			{
				this._nexts = [ {step:HaveRepeater}];
			}
		}
		else
			this._nexts = [{step: _TestSpeed, params: []}];

		super.onNoClick();
	}
}