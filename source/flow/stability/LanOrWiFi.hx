package flow.stability;

import process.Descision;

/**
 * ...
 * @author ...
 */
class LanOrWiFi extends Descision 
{

	override public function create():Void
	{
		//this._titleTxt = "Tests En LAN ou WiFi";
		//this._detailTxt = "";
		//this._buttonNoTxt = "LAN";
		//this._buttonYesTxt = "WiFi";
		//this._illustration = "";
		this._nextNoProcesses = [new ValuesOverEighty()];
		this._nextYesProcesses = [ new ValuesOverTwenty()];
		super.create();
	}
	
}