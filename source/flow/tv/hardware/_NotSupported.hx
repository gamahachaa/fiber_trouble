package flow.tv.hardware;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _NotSupported extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
	
}