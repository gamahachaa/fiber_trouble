package flow.all.customer;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WhichBox extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: CHANGEME, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: CHANGEME, params: []}];
		super.onNoClick();
	}
	//Main.customer.iri = is_sagem ? contractorID : voipSO;
}