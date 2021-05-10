package flow.tv.install;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HasSwissAppleID extends Descision
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _LogInWithSwissAppleID, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: WantToChangeToSwiss, params: []}];
		super.onNoClick();
	}
}