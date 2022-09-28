package flow.phone;

import flow.tickets.CustomerInstruction;
import flow.tickets.VoipCallDroped;
import flow.tickets.VoipCallerID;
import flow.tickets.VoipCalls;
import flow.tickets.VoipFNP;
import flow.tickets.VoipProvisioning;
import flow.tickets.VoipSoundQuality;
import flow.tickets.VoipTicket;
import regex.ExpReg;
import tstool.layout.History.ValueReturn;
import tstool.process.ActionMultipleInput;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class InputDeviceNameAndBrand extends ActionMultipleInput 
{
	static inline var DEVICE:String = "Device";
	static inline var BRAND:String = "Brand";

	public function new ()
	{
		super(
		[{
			ereg: new EReg(ExpReg.NAME_FULL,"i"),
			input:{
				width:250,
				prefix:DEVICE,
				position: [bottom, left],
				mustValidate: [Next]
			}
		},
		{
			ereg: new EReg(ExpReg.NAME_FULL, "i"),
			
			input:{
				width:250,buddy: DEVICE,
				prefix:BRAND,
				position: [bottom, left],
				mustValidate: [Next]
			}
		}
		]
		);
	}
	
	
	override public function onClick():Void
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
		if (validate())
		{
			this._nexts = [{step: CustomerInstruction,params: [{step: next},{step: next}]}];
			super.onClick();
		}
	}
	//inline function getNext():Class<Process>{
		//return VoipTicket;
	//}
	/****************************
	* Needed only for validation
	*****************************/
	/*
	override public function validate():Bool
	{
		return true;
	}
	*/
	
}