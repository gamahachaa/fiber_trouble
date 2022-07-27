package flow.tv.sound.volume;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _SetVolListRemotes extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: VolIssueSolved, params: []}];
		super.onClick();
	}
}