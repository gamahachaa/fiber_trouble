package flow.ftth.status;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _InformCanChangeAdress extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
	
}