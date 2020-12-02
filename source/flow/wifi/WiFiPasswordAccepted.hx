package flow.wifi;

import flow.lan._CreateLanIssueTicket;
import flow.wifi._CreateTicketWifiIssue;
import flow.all.fiberbox._LoopResetFiberBox;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class WiFiPasswordAccepted extends Descision
{
	
	override public function onYesClick():Void
	{
		this._nexts = [{step:ErrorIconOnWifiIcon}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		if (Main.HISTORY.isClassInteractionInHistory( _LoopResetFiberBox, Yes) )
		{
			this._nexts = [{step: _CreateTicketWifiIssue }];
		}
		else{
			this._nexts = [{
				step: _LoopResetFiberBox,
				params:[
					{step:WifiVisibleOnDevice}, 
					{step:WifiVisibleOnDevice}]
			}];
		}
		super.onNoClick();
	}

}