package flow.tv.remote.satltv;

import flow.tv.hardware._UnplugAppleTVPowerCable;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CanReplaceBatteries extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = switch (Main.HISTORY.findValueOfFirstClassInHistory( WichRemote, WichRemote.REMOTE_VERSION).value)
		{
			case WichRemote.SALT_V2 :[{step:_UnplugAppleTVPowerCable}];
			case _ : [{step:DoesRedLedBlinksOnRemoteWhenPressed}];
		};
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _ReplaceBatteriesThenCallUsBack, params: []}];
		super.onNoClick();
	}
}