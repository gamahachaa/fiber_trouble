package flow.wifi;

import flow.stability._TestSpeed;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HaveRepeater extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _TestSpeed, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _InformAboutRepeaterGoodness, params: []}];
		super.onNoClick();
	}
	
}