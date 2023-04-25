package flow.nointernet.customer;

import flow.nointernet.so.IsTicketOpened;
import flow.nointernet.vti.CheckContractorVTI;
import tstool.layout.History.ValueReturn;
import tstool.process.Action;

using StringTools;

/**
 * ...
 * @author bb
 */
class BielIncidentInQoof extends Action 
{
    override public function create():Void 
	{
		var CheckContractorValues:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(CheckContractorVTI, CheckContractorVTI.BIEL_INCIDENT_LOCATION);
		if (CheckContractorValues.exists)
		{
			this._titleTxt = this._titleTxt.replace( "<LOCATION>", CheckContractorValues.value.toUpperCase()); 
		}
		
		super.create();
	}
	override public function onClick():Void
	{
		this._nexts = [{step: IsTicketOpened, params: []}];
		super.onClick();
	}
	
}