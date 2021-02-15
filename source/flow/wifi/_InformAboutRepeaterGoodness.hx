package flow.wifi;

import flow.stability._TestSpeed;
//import tstool.process.Action;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class _InformAboutRepeaterGoodness extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: SendRepeaterSOTemplate, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _TestSpeed, params: []}];
		super.onNoClick();
	}
	
}