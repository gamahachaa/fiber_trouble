package flow.stability;


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
		return if (Main.HISTORY.isClassInteractionInHistory(flow.Intro, No))
		{
			//_CreateSOTicketSaltTV;
			{step: CustomerInstruction, params: [{step: _CreateSOTicketSaltTV}, {step: _CreateSOTicketSaltTV}]};
		}
		else{
			//_CreateSOTechModemSpeed;
			{step: CustomerInstruction, params: [{step: _CreateSOTechModemSpeed},{step: _CreateSOTechModemSpeed}]}
		}
	}
}