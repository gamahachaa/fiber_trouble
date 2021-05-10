package flow.all.customer;

import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class IsSlowOrKaput extends Triplet 
{
	/*override public function create()
	{
		//var next = new CheckContractorVTI();
		//var next2 = new HowManyDevicesAreConnected();
		var next2 = new LanOrWiFi();
		
		this._nextNoProcesses = [new EverWorkedBefore()];
		this._nextYesProcesses = [next2];
		this._nextMidProcesses = [next2];
		super.create();
	}*/
	/*
	override public function create()
	{
		super.create();
	}
	*/
	
	override public function onYesClick():Void
	{
		this._nexts = [{step: LanOrWiFi, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: EverWorkedBefore, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: LanOrWiFi, params: []}];
		super.onMidClick();
	}
}