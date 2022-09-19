package flow.tv.sound.volume;

import flow.tv.remote.WichRemote;
import flow.tv.remote.siri.DifficultiesWithUsingSiri;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class VolIssueSolved extends Descision 
{

	override public function onYesClick():Void
	{
		//this._nexts = [{step: CHANGEME, params: []}];
		this._nexts = switch (Main.HISTORY.findValueOfFirstClassInHistory( WichRemote, WichRemote.REMOTE_VERSION).value){
			case WichRemote.SIRI_V1 : [{step: DifficultiesWithUsingSiri, params: []}];
			case _ : [{step: _AddMemoVti, params: []}];// salt v2
		}
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _CreateSOTicketSaltTV, params: []}];
		super.onNoClick();
	}
	
}