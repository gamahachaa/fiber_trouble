package flow.stability.atf;

import flow.all.fiberbox._LoopResetFiberBox;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsAdminAvailable extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: IsAtfActive, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _LoopResetFiberBox, params: [{step: _TestAgain}]}];
		super.onNoClick();
	}
	
}