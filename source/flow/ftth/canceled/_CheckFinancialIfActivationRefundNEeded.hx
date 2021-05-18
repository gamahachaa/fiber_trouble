package flow.ftth.canceled;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _CheckFinancialIfActivationRefundNEeded extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
	
}