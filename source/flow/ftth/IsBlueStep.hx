package flow.ftth;

import flow.ftth.status.IsQualifDone;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsBlueStep extends Descision 
{

override public function onYesClick():Void
{
	this._nexts = [{step: IsQualifDone, params: []}];
	super.onYesClick();
}
override public function onNoClick():Void
{
	this._nexts = [{step: IsDelegateOrPluginUse, params: []}];
	super.onNoClick();
}
	
}