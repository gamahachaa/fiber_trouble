package flow.nointernet.vti;

import flow.collection._VerifyCollectionStep;
import flow.lan.ConnectedViaSwitch;
import flow.phone.WasThereAnyCallFWD;
import flow.wifi.WifiOnInDashboard;
import tstool.layout.History.ValueReturn;
//import tstool.process.Descision;
import tstool.process.Process;
import tstool.process.Triplet;

/**
 * ...
 * @author ...
 */
class IsBarred extends Triplet
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _VerifyCollectionStep, params: []}];
		super.onYesClick();
	}
	override public function onMidClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onMidClick();
	}
	override public function onNoClick():Void
	{
		
		this._nexts = [{step: getNext() , params: []}];
		super.onNoClick();
	}
	inline function getNext():Class<Process>
	{
		 var isPhone:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		return if (Main.HISTORY.isClassInteractionInHistory(flow.all.customer.LanOrWiFi, Yes))
		{
			WifiOnInDashboard;
		}
		else if (isPhone.exists)
		{
			WasThereAnyCallFWD;
		}
		else{
			ConnectedViaSwitch;
		}
	}
}