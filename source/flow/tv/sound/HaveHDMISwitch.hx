package flow.tv.sound;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HaveHDMISwitch extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _ConnectHDMIDirectToTV, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _TryReversingHDMI, params: []}];
		super.onNoClick();
	}
	
}