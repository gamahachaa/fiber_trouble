package flow.ftth;

import flow.ftth.pluginuse.IsPlugInUse;
import flow.ftth.delegate.IsDSODelegate;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsDelegateOrPluginUse extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: IsDSODelegate, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsPlugInUse, params: []}];
		super.onNoClick();
	}
	
}