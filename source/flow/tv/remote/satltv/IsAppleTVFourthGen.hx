package flow.tv.remote.satltv;

import flow._AddMemoVti;
//import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import flow.tv.remote.exttv.DoesVolumeChangeOnTV;
import tstool.process.Descision;
import tstool.process.Process.ProcessContructor;

/**
 * ...
 * @author bb
 */
class IsAppleTVFourthGen extends Descision 
{
	/*
	override public function create()
	{
		
		
		//this._nextYesProcesses =  [new DoesAppleTVLedBlinks(new DoesVolumeChangeOnTV(), new WasThePurchaseDoneLessThanOnYearAgo())] ;
		super.create();
	}*/
	/*
	override public function create()
	{
		this._nextNoProcesses = [];
		this._nextYesProcesses = [];
		super.create();
	}
	*/
	/****************************
	* Needed for validation
	*****************************/
	
	override public function onYesClick():Void
	{
		var next:ProcessContructor = {
			step:DoesAppleTVLedBlinks, 
			params: [
				{step:DoesVolumeChangeOnTV},
				{step:WasThePurchaseDoneLessThanOnYearAgo}
			]
		};
		this._nexts =  [next] ;
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [
		{
			step: _AddMemoVti
		}];
		super.onNoClick();
	}
}