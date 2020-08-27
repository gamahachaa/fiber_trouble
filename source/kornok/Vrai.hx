package kornok;

import kornok.CQuoiSaRace;
import kornok.EstCeQuillAUnFrere;
import tstool.process.Action;


/**
 * ...
 * @author ...
 */
class Vrai extends Action 
{
	static var INTERATIONS = -1;
	override public function create():Void
	{
		this._detailTxt = "Bravo tu es au point sur Kornok";
		this._titleTxt = "";
		this._illustration = "kornok/vrai-png";
		this._nextProcesses = [new CQuoiSaRace(), new EstCeQuillAUnFrere()];
		
		super.create();
		
	}
}