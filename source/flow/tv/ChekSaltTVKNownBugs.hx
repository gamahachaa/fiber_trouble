package flow.tv;

//import tstool.process.Action;
import flow.tv.app._QuitAndRelaunchSaltTV;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class ChekSaltTVKNownBugs extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _InformSaltIsFixing, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _QuitAndRelaunchSaltTV, params: []}];
		super.onNoClick();
	}
}