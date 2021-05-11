package flow.ftth;

import flow.ftth.canceled._PomCanceledOrOfferClosed;
import js.Browser;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsRedStep extends Descision 
{
	override public function create()
	{
		super.create();
		/**
			 * @TODO keep clipboard trick to fill clipboard with data
			 */
		Browser.document.addEventListener("copy", function(e){e.clipboardData.setData('text/plain', Main.customer.contract.contractorID);e.preventDefault();});
	}
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