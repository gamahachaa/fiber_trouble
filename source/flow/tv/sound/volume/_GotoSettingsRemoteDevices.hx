package flow.tv.sound.volume;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _GotoSettingsRemoteDevices extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _SelectVoluemCtrlMemoNewDevice, params: []}];
		super.onClick();
	}
	
}