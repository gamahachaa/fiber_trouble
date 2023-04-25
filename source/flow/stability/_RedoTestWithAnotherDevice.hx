package flow.stability;

import flow.all.customer.LanOrWiFi;
import flow.all.fiberbox._AdvicePutOpenSpace;
import flow.tickets.CustomerInstruction;
import flow.tv._CreateSOTicketSaltTV;
//import tstool.process.Descision;
import tstool.process.Process;
import tstool.process.Triplet;
/**
 * ...
 * @author bb
 */
class _RedoTestWithAnotherDevice extends Triplet
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _ShareAdviceOptimalWifi, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [getNext()];
		super.onNoClick();
	}

	override public function onMidClick():Void
	{
		this._nexts = [getNext()];
		super.onMidClick();
	}
	function getNext():ProcessContructor
	{
		//var mainIssue = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		var isWiFiOnly = Main.HISTORY.isClassInteractionInHistory(LanOrWiFi, Yes);
		//return if (Main.HISTORY.isClassInteractionInHistory(flow.Intro, No))
		var openSpace:Bool = isBoxInOpenedSpace();
		/*return if (mainIssue.value == Intro.tv)
		{
			//tv;
			if(openSpace)
				{step: CustomerInstruction, params: [{step: _CreateSOTicketSaltTV}, {step: _CreateSOTicketSaltTV}]};
			else
				{step: _AdvicePutOpenSpace };
		}
		else{*/
		return if (openSpace || !isWiFiOnly)
			{step: CustomerInstruction, params: [ {step: _CreateSOTechModemSpeed}, {step: _CreateSOTechModemSpeed}]}
		else {step: _AdvicePutOpenSpace}
		/*}*/
	}
	function isBoxInOpenedSpace():Bool
	{
		var boxLocationStatus = Main.HISTORY.findValueOfFirstClassInHistory(flow.all.fiberbox._WhereIsBoxPlaced, flow.all.fiberbox._WhereIsBoxPlaced.TITLE);
		return boxLocationStatus.exists && (boxLocationStatus.value == flow.all.fiberbox._WhereIsBoxPlaced.ONE_OPENED);
	}
}