package kornok;

import kornok.Faux;
import kornok.Vrai;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class KornokIsExmoore extends Descision
{

	override public function create():Void
	{
		this._titleTxt = "Kornok est-il un exmoor ?";
		this._detailTxt = "";
		this._illustration = "kornok/Exmoor";
		this._nextYesProcesses = [new Faux()];
		this._nextNoProcesses = [new Vrai()];
		super.create();
	}

}