package flow.nointernet.fiberbox;

import process.*;

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
		this._nextProcesses = [new Intro()];
		super.create();
	}
}