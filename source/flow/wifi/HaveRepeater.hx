package flow.wifi;

import flow.stability._TestSpeed;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HaveRepeater extends Descision 
{
    public function new ()
	{
		super();
	}
	override public function onYesClick():Void
	{
		#if debug
		trace("flow.wifi.HaveRepeater::onYesClick");
		#end
		this._nexts = [{step: _TestSpeed, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		#if debug
		trace("flow.wifi.HaveRepeater::onNoClick");
		#end
		this._nexts = [{step: _InformAboutRepeaterGoodness, params: []}];
		super.onNoClick();
	}
	
}