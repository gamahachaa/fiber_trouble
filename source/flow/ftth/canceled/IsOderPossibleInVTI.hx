package flow.ftth.canceled;

import flow.equipment._SoOrderProcessStatusCheck;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsOderPossibleInVTI extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _SoOrderProcessStatusCheck, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _CheckFinancialIfActivationRefundNEeded, params: []}];
		super.onNoClick();
	}
	
}