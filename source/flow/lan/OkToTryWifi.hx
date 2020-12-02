package flow.lan;

import flow.wifi.WifiOnInDashboard;
import tstool.process.Descision;
import tstool.process.Process;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class OkToTryWifi extends Triplet 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _CreateLanIssueTicket, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: _CreateLanIssueTicket, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: _CreateLanIssueTicket, params: []}];
		super.onMidClick();
	}
}