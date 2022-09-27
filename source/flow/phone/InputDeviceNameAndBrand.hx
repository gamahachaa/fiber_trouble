package flow.phone;

import flow.tickets.CustomerInstruction;
import flow.tickets.VoipCallDroped;
import flow.tickets.VoipCallerID;
import flow.tickets.VoipSoundQuality;
import flow.tickets.VoipTicket;
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
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:250,
				prefix:DEVICE,
				position: [bottom, left]
			}
		},
		{
			ereg: new EReg("[\\s\\S]*", "i"),
			
			input:{
				width:250,buddy: DEVICE,
				prefix:BRAND,
				position: [bottom, left]
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
			case _ : VoipTicket;
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