package flow.ftth.pluginuse;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WasCancelationSent extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onNoClick();
	}
	
}