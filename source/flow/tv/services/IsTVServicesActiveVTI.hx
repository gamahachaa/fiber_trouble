package flow.tv.services;
import flow.tv.app._QuitAndRelaunchSaltTV;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsTVServicesActiveVTI extends Descision
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _QuitAndRelaunchSaltTV, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsBarringVisible, params: []}];
		super.onNoClick();
	}
}