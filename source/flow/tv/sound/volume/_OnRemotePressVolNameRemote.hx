package flow.tv.sound.volume;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _OnRemotePressVolNameRemote extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _SetVolListRemotes, params: []}];
		super.onClick();
	}
	
}