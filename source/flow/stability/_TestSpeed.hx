package flow.stability;

import flow.all.fiberbox._LoopResetFiberBox;
import flow.nointernet.fiberbox._RebootBox;
import tstool.process.Descision;
import tstool.process.DescisionMultipleInput;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class _TestSpeed extends DescisionMultipleInput 
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
	
	public function new ()
	{
		super(
		[{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:600,
				prefix:"Speedtest 1",
				position: [bottom, left]
			}
		},
		{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:600,
				prefix:"Speedtest 2",
				buddy: "Speedtest 1",
				position: [bottom, left]
			}
		},
		{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:600,
				prefix:"Speedtest 3",
				buddy: "Speedtest 2",
				position: [bottom, left]
			}
		}]
		);
	}
	
	/**/
	override public function validateYes():Bool
	{
		return true;
	}
	/**/
	/*  */
	override public function validateNo():Bool
	{
		return true;
	}
	/**/
	
	override public function onYesClick():Void
	{
		//this._nexts = [{step: _RebootBox, params: [
				//{step: _RedoTestWithAnotherDevice},
				//{step: _RedoTestWithAnotherDevice}
			//]}];
		this._nexts = [{
			step: _RebootBox, 
			params: [
				{step: _LoopResetFiberBox, params: [{step: _RedoTestWithAnotherDevice},{step: _RedoTestWithAnotherDevice}]},
				{step: _LoopResetFiberBox, params: [{step: _RedoTestWithAnotherDevice},{step: _RedoTestWithAnotherDevice}]}
			]	
		}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _ShareAdviceOptimalWifi, params: []}];
		super.onNoClick();
	}
}