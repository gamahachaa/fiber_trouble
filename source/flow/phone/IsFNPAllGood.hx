package flow.phone;

import flow.tickets.CustomerInstruction;
import flow.tickets.VoipCalls;
import flow.tickets.VoipFNP;
import tstool.process.Process;
//import flow.tickets.VoipTicket;
import tstool.process.Descision;
//import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class IsFNPAllGood extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: getNext()}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: getNext()}];
		super.onNoClick();
	}
	inline function getNext():Class<Process>{
		return WhichCallsAreImpacted;
	}
}