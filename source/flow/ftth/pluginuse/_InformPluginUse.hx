package flow.ftth.pluginuse;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _InformPluginUse extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: WasCancelationSent, params: []}];
		super.onClick();
	}
}