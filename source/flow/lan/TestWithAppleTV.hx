package flow.lan;

import flow.lan._CreateLanIssueTicket;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class TestWithAppleTV extends Descision
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: LanConnectionOK, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _TestWithAnotherLanDevice, params: []}];
		super.onNoClick();
	}
}