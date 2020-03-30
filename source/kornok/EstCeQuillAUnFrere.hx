package kornok;

import kornok.Faux;
import kornok.Vrai;
import process.Descision;

/**
 * ...
 * @author ...
 */
class EstCeQuillAUnFrere extends Descision
{

	override public function create():Void
	{
		this._titleTxt = "Kornok a-t-il un frère ?";
		this._detailTxt = "";
		this._buttonNoTxt = "Non";
		this._buttonYesTxt = "Oui";
		this._illustration = "kornok/radenetkornok";
		this._nextYesProcesses = [new Vrai()];
		this._nextNoProcesses = [new Faux()];
		super.create();
	}

}