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
	{
		this._nexts = [{step: _ExplainMainSteps, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: _ExplainMainSteps, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: _ExplainMainSteps, params: []}];
		super.onMidClick();
	}
}