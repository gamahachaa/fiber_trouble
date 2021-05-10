package flow.ftth;

import flow.ftth.canceled._PomCanceledOrOfferClosed;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsRedStep extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _PomCanceledOrOfferClosed, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsBlueStep, params: []}];
		super.onNoClick();
	}
}