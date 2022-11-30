package flow.phone;

import flow.nointernet.vti.CheckContractorVTI;
import tstool.layout.History.ValueReturn;
import tstool.process.Descision;
import tstool.process.Process;
import  flow.phone.WhatIsthePhoneISsue;

/**
 * ...
 * @author bb
 */
class ConnectToDECT extends Descision
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onNoClick();
	}
	inline function getNext():Class<Process>
	{
		var mainIssue:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(flow.phone.WhatIsthePhoneISsue, WhatIsthePhoneISsue.ISSUE);
		var isB2B:Bool = Main.HISTORY.isClassInteractionInHistory(CheckContractorVTI, Mid);
		var cls:Class<Process> = isB2B?ListImpactedNumbers:ProvideSamples;
		return switch(mainIssue.value)
		{
			case WhatIsthePhoneISsue.sound_quality: cls;
			case WhatIsthePhoneISsue.no_calls: IsProvisionsingAllGood;
			case WhatIsthePhoneISsue.caller_id: WhicNumAreNotDisplayed;
			case _ : WhichCallsAreImpacted;
				
		}
	}

}