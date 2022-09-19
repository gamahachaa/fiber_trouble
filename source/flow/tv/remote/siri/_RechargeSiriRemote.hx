package flow.tv.remote.siri;

import flow.tv.remote.repair.WasThePurchaseDoneLessThanOnYearAgo;
import tstool.process.Action;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class _RechargeSiriRemote extends Descision
{
	/*override public function onClick():Void
	{
		this._nexts = [{step: _GetCloseToAppleTV, params: []}];
		super.onClick();
	}*/
	override public function onYesClick():Void
	{
		// will recharge --> End
		this._nexts = [{step: _CallUsBackWhenSiriRecharged, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		// Already Charged
		this._nexts = switch (Main.HISTORY.findValueOfFirstClassInHistory( WichRemote, WichRemote.REMOTE_VERSION).value)
		{
			case WichRemote.SIRI_V1 : [ {step: WasThePurchaseDoneLessThanOnYearAgo, params: []}];
			case _ : [ {step: _ContactApple, params: []}];
		}
		super.onNoClick();
	}
}