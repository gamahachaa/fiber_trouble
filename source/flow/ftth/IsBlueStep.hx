package flow.ftth;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsBlueStep extends Descision 
{

override public function onYesClick():Void
{
	this._nexts = [{step: CHANGEME, params: []}];
	super.onYesClick();
}
override public function onNoClick():Void
{
	this._nexts = [{step: IsDelegateOrPluginUse, params: []}];
	super.onNoClick();
}
	
}