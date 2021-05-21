package flow.stability.atf;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _AskToRebootBox extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _DeactivateATF, params: []}];
		super.onClick();
	}
	
}