package kornok;

import kornok.Faux;
import kornok.Vrai;
import process.Descision;

/**
 * ...
 * @author ...
 */
class CQuoiSaRace extends Descision
{

	override public function create():Void
	{
		this._titleTxt = "mais alors c'est quoi sa race ?";
		this._detailTxt = "";
		this._buttonNoTxt = "Dartmoor";
		this._buttonYesTxt = "Haflinger";
		this._illustration = "kornok/haflinger_dartmoor";
		this._nextYesProcesses = [new Faux()];
		this._nextNoProcesses = [new Vrai()];
		super.create();
	}

}