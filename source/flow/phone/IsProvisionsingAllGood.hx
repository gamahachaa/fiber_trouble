package flow.phone;

import flow.tickets.CustomerInstruction;
import flow.tickets.VoipProvisioning;
//import flow.tickets.VoipTicket;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsProvisionsingAllGood extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: IsFNPAllGood, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: CustomerInstruction,params: [{step: VoipProvisioning},{step: VoipProvisioning}]}];
		
		super.onNoClick();
	}
}