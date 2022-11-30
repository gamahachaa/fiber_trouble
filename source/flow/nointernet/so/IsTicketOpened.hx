package flow.nointernet.so;

//import flow.all.customer.IsSlowOrKaput;
//import flow.all.customer.LanOrWiFi;
import flow.all.fiberbox.WhatBoxIsIt;
import flow.tv.hardware.IsAppleTVFourthGen;
//import flow.tv.remote.WichRemote;
//import flow.nointernet.customer.FiberCableChanged;
//import flow.nointernet.vti.CheckContractorVTI;
//import flow.tickets.CustomerInstruction;
//import flow.all.customer.WhichBox;
//import flow.equipment.IsWhishDateWayAhead;
import flow.escalation.IsTechTicket;
//import flow.nointernet.fiberbox.IsBoxReachable;
//import flow.stability._TestSpeed;
//import flow.stability.atf.IsFWToTheLatest;
import flow.tv.WhatIStheTVIssue;
//import flow.wifi.HaveRepeater;
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
		if (Main.HISTORY.isClassInteractionInHistory(WhatIStheTVIssue, Yes))
		{
			//this._nexts = [{step: WichRemote, params: []}];
			this._nexts = [{step: IsAppleTVFourthGen, params: []}];
		}
		else 
			this._nexts = [{step: WhatBoxIsIt, params: []}];
		super.onNoClick();
	}
}