package flow.phone;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class PurchaseANewPhone extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
	
}