package flow.equipment;


import flow._AddMemoVti;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class DidCustomerSendProffCancel extends Triplet 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _SoPluginUseInfo, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: _SoPluginUseInfo, params: []}];
		super.onMidClick();
	}
}