package flow.ftth.delegate;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _InformToReply extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
	
}