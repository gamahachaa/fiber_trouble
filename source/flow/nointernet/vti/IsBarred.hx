package flow.nointernet.vti;

import flow.collection._VerifyCollectionStep;
import flow.lan.ConnectedViaSwitch;
import flow.wifi.WifiOnInDashboard;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class IsBarred extends Descision
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _VerifyCollectionStep, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		if (Main.HISTORY.isClassInteractionInHistory(flow.all.customer.LanOrWiFi, Yes))
		{
			this._nexts = [{step: WifiOnInDashboard, params: []}];
		}
		else{
			this._nexts = [{step: ConnectedViaSwitch, params: []}];
		}
		
		super.onNoClick();
	}
}