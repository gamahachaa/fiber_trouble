package flow.tv.install;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HasAppleId extends Descision
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: HasSwissAppleID, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: CanCreateAppleAccount, params: []}];
		super.onNoClick();
	}
}