package flow.nointernet.fiberbox;

import flow.Intro;
import process.*;
import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _SpeedAndStability extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Valeurs RX hors norme ?";
		//this._detailTxt = "Suivre procedure Speed et stabiltté";
		//this._illustration = "";
		this._nextProcesses = [new flow.Intro()];
		super.create();
	}
}