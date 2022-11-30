package flow.phone;

import flow.tickets.CustomerInstruction;
import flow.tickets.VoipCallDroped;
import flow.tickets.VoipCallerID;
import flow.tickets.VoipCalls;
import flow.tickets.VoipFNP;
import flow.tickets.VoipProvisioning;
import flow.tickets.VoipSoundQuality;
import tstool.layout.History.ValueReturn;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class IsPhoneGigasetE370HX extends Descision 
{

	override public function onYesClick():Void
	{
		var phoneIssue:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(WhatIsthePhoneISsue, WhatIsthePhoneISsue.ISSUE);
		var next:Class<Process> = switch (phoneIssue.value){
			case WhatIsthePhoneISsue.caller_id : VoipCallerID;
			case WhatIsthePhoneISsue.drop_calls : VoipCallDroped;
			case WhatIsthePhoneISsue.sound_quality : VoipSoundQuality;
			case _ : VoipCalls;
		}
		if (next == VoipCalls)
		{
			if (Main.HISTORY.isClassInteractionInHistory(IsFNPAllGood, No))
			{
				next = VoipFNP;
			}
			else if (Main.HISTORY.isClassInteractionInHistory(IsProvisionsingAllGood, No))
			{
				next = VoipProvisioning;
			}
		}
		
		this._nexts = [{step: CustomerInstruction,params: [{step: next},{step: next}]}];
		super.onYesClick();
		
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: InputDeviceNameAndBrand, params: []}];
		super.onNoClick();
	}
	
}