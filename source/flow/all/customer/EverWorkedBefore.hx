package flow.all.customer;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class EverWorkedBefore extends Descision 
{

	//override public function create()
	//{
		//var next2 = new LanOrWiFi();
		//this._nextNoProcesses = [next2];
		//this._nextYesProcesses = [next2];
		//super.create();
	//}
	override public function onYesClick():Void
	{
		this._nexts = [{step: LanOrWiFi, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: LanOrWiFi, params: []}];
		super.onNoClick();
	}
}