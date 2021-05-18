package flow.ftth.pluginuse;

import flow.vti._UpdateAdressVTI;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class BouncePluginUse extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _UpdateAdressVTI, params: [{step: _SendPluginUseTemplate}]}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _InformPluginUse, params: []}];
		super.onNoClick();
	}
	
}