package flow.all.customer;

import flow.nointernet.vti.CheckContractorVTI;
import tstool.process.Triplet;

/**
 * ...
 * @author ...
 */
class LanOrWiFi extends Triplet 
{

	override public function onYesClick():Void
	{ //WIFI
		this._nexts = [{step: _ExplainMainSteps, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{   //LAN
		this._nexts = [{step: _ExplainMainSteps, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{   //BOTH
		this._nexts = [{step: _ExplainMainSteps, params: []}];
		super.onMidClick();
	}
}