package flow.tv.services;

import flow._AddMemoVti;
import flow.tv.app._QuitAndRelaunchSaltTV;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsSaltTVWorkingNow extends Descision 
{
	
	override public function onYesClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _QuitAndRelaunchSaltTV, params: []}];
		super.onNoClick();
	}
}