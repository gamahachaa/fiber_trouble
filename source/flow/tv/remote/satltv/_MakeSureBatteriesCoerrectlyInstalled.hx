package flow.tv.remote.satltv;

import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _MakeSureBatteriesCoerrectlyInstalled extends Action 
{
	override public function onClick():Void
	{
		this._nexts = switch(Main.HISTORY.findValueOfFirstClassInHistory( WichRemote, WichRemote.REMOTE_VERSION).value){
			case WichRemote.SALT_V2 : [{step: CanReplaceBatteries, params: []}];
			case _ : [{step: DoesRedLedBlinksOnRemoteWhenPressed, params: []}];
		}
		super.onClick();
	}
}