package flow.nointernet.vti;

import flow.collection._VerifyCollectionStep;
import flow.lan.ConnectedViaSwitch;
import flow.wifi.WifiOnInDashboard;
import tstool.layout.History.ValueReturn;
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
		var isPhone:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		if (Main.HISTORY.isClassInteractionInHistory(flow.all.customer.LanOrWiFi, Yes))
		{
			this._nexts = [{step: WifiOnInDashboard, params: []}];
		}
		else if (isPhone.exists)
		{
			this._nexts = [{step: flow.phone.IsTheDeviceWorking, params: []}];
		}
		else{
			this._nexts = [{step: ConnectedViaSwitch, params: []}];
		}
		
		super.onNoClick();
	}
}