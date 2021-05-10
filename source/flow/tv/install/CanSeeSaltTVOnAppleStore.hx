package flow.tv.install;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CanSeeSaltTVOnAppleStore extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _InstallSaltTV, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: HasAppleId, params: []}];
		super.onNoClick();
	}
}