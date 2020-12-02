package flow.tv.install;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WantToChangeToSwiss extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _HowToChangeAppleIDtoSwiss, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _ResetAppleTV, params: []}];
		super.onNoClick();
	}
}