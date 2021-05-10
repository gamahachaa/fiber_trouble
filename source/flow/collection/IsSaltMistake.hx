package flow.collection;

import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class IsSaltMistake extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _SoTicketTreeTwoOne, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: PayedAlready, params: []}];
		super.onNoClick();
	}
}