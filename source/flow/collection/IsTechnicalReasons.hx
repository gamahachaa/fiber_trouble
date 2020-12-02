package flow.collection;

import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class IsTechnicalReasons extends Descision 
{

	
	override public function onYesClick():Void
	{
		this._nexts = [{step: _ExplainReasons, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _Pay, params: []}];
		super.onNoClick();
	}
}