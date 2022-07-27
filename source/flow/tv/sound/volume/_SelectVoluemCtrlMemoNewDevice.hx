package flow.tv.sound.volume;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _SelectVoluemCtrlMemoNewDevice extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _OnRemotePressVolNameRemote, params: []}];
		super.onClick();
	}
}