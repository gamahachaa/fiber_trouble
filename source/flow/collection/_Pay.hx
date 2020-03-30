package flow.collection;

import process.Action;

/**
 * ...
 * @author ...
 */
class _Pay extends Action
{

	override public function create():Void
	{
		//this._titleTxt = "Le client doit payer les montants en sourfrance.";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextProcesses = [new _InformUsualPaymentDelays()];
		super.create();
	}

}