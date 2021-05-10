package flow.tv.remote.satltv;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CanReplaceBatteries extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: DoesRedLedBlinksOnRemoteWhenPressed, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _ReplaceBatteriesThenCallUsBack, params: []}];
		super.onNoClick();
	}
}