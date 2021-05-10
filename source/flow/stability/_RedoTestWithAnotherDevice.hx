package flow.stability;


import flow.tv._CreateSOTicketSaltTV;
import tstool.process.Descision;
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
		this._nexts = [{step: getNext(), params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onMidClick();
	}
	function getNext():Class<Process>
	{
		return if (Main.HISTORY.isClassInteractionInHistory(flow.Intro, No))
		{
			_CreateSOTicketSaltTV;
		}
		else{
			_CreateSOTechModemSpeed;
		}
	}
}