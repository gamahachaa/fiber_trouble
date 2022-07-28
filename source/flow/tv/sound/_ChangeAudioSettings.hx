package flow.tv.sound;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ChangeAudioSettings extends Action 
{

	override public function onClick():Void
	{
		this._nexts = [{step: _StoreCustomersSetup, params: []}];
		super.onClick();
	}
	
}