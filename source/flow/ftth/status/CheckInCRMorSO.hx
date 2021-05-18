package flow.ftth.status;

import flow.equipment._SoOrderProcessStatusCheck;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class CheckInCRMorSO extends Triplet 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onNoClick();
	}
	override public function onMidClick():Void
	{
		this._nexts = [{step: _SoOrderProcessStatusCheck, params: []}];
		super.onNoClick();
	}
	
}