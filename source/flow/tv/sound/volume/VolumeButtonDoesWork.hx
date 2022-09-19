package flow.tv.sound.volume;

import flow.tv.remote.WichRemote;
import flow.tv.remote.siri.DifficultiesWithUsingSiri;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class VolumeButtonDoesWork extends Descision 
{   var remote:String;
    override public function create():Void 
	{
		remote = Main.HISTORY.findValueOfFirstClassInHistory( WichRemote, WichRemote.REMOTE_VERSION).value;
		super.create();
	}
	override public function onYesClick():Void
	{
		this._nexts = switch (remote){
			case WichRemote.SIRI_V1 : [{step: DifficultiesWithUsingSiri, params: []}];
			case _ : [{step: _AddMemoVti, params: []}];// salt v2
		}
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _GotoSettingsRemoteDevices, params: []}];
		super.onNoClick();
	}
	
}