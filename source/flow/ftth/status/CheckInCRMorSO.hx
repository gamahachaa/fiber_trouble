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
		//in S.O
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		// in VTI
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onNoClick();
	}
	override public function onMidClick():Void
	{
		//Nowhere
		this._nexts = [{step: _SoOrderProcessStatusCheck, params: []}];
		super.onMidClick();
	}
	
}