package flow.stability.atf;

import flow.wifi.HaveRepeater;
import flow.wifi._MoveCloseUnplugRepeater;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsAtfActive extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{
					step: _MoveCloseUnplugRepeater,
					params: [
						{step:HaveRepeater}, 
						{step:HaveRepeater}
					]
			}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _DeactivateATF, params: []}];
		super.onNoClick();
	}
	
}