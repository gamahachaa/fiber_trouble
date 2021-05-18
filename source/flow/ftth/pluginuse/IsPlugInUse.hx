package flow.ftth.pluginuse;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsPlugInUse extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: BouncePluginUse, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _SendPluginUseTemplate, params: []}];
		super.onNoClick();
	}
}