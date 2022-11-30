package flow.phone;

import flow.tickets.CustomerInstruction;
import flow.tickets.VoipCallDroped;
import flow.tickets.VoipCallerID;
import flow.tickets.VoipCalls;
import flow.tickets.VoipFNP;
import flow.tickets.VoipProvisioning;
import flow.tickets.VoipSoundQuality;
//import flow.tickets.VoipTicket;
import regex.ExpReg;
import tstool.layout.History.ValueReturn;
//import tstool.process.ActionMultipleInput;
import tstool.process.DescisionMultipleInput;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class InputDeviceNameAndBrand extends DescisionMultipleInput 
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
				debug:"E370HX",
				position: [bottom, left],
				mustValidate: [Next]
			}
		},
		{
			ereg: new EReg(ExpReg.NAME_FULL, "i"),			
			input:{
				width:250,buddy: DEVICE,
				prefix:BRAND,
				debug:"Gigaset",
				position: [bottom, left],
				mustValidate: [Next]
			}
		}
		]
		);
	}
	
	
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
		if (validateYes())
		{
			this._nexts = [{step: CustomerInstruction,params: [{step: next},{step: next}]}];
			super.onYesClick();
		}
	}
	override public function onNoClick():Void 
	{
		this._nexts = [{step: _AddMemoVti}];
		super.onNoClick();
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