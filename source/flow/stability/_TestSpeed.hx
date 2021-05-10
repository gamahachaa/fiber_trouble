package flow.stability;

import flow.nointernet.fiberbox._RebootBox;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class _TestSpeed extends Descision 
{
	/*override public function create()
	{
		this._nextYesProcesses = [ new _RebootBox(new _RedoTestWithAnotherDevice(),new _RedoTestWithAnotherDevice())];
		this._nextNoProcesses = [new _ShareAdviceOptimalWifi()];
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
		this._nexts = [{step: _RebootBox, params: [
				{step: _RedoTestWithAnotherDevice},
				{step: _RedoTestWithAnotherDevice}
			]}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _ShareAdviceOptimalWifi, params: []}];
		super.onNoClick();
	}
}