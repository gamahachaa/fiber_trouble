package flow.vti;
import flow.all.customer.LanOrWiFi;
import flow.all.fiberbox._AdvicePutOpenSpace;
import flow.nointernet.customer.FiberCableChanged;
import flow.stability._TestSpeed;
import flow.swapcable.SwapFiberCable;
import flow.tv.WhatIStheTVIssue;
import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import flow.tv.sound._StoreCustomersSetup;
import flow.wifi.HaveRepeater;
import regex.ExpReg;
import tstool.process.ActionMultipleInput;
import tstool.process.Process;
using StringTools;

/**
 * ...
 * @author bb
 */
class _RXfromVTI extends ActionMultipleInput
{
	var next:ProcessContructor;
	public static inline var RX = "VTI RX";

	public function new()
	{
		super(
		[{
			ereg: new EReg(ExpReg.RX, "i"),
			hasTranslation:true,
			input:{
				width:300,
				prefix: RX,
				debug: "-22",
				position: [bottom, left]
			}
		}]
		);
		
	}
	override public function onClick():Void
	{
		//this._nexts = [getNext()];
		if (validate())
		{
			
			var rx:String = this.multipleInputs.inputs.get(RX).getInputedText().replace("dBm","");
			if (Std.parseFloat(rx) > -21)
			{
				getNextRXGood();
			}
			else
			{
				getNextRXBAD();
			}
			super.onClick();
		}
		
	}
	function getNextRXGood()
	{
		var boxLocationStatus = Main.HISTORY.findValueOfFirstClassInHistory(flow.all.fiberbox._WhereIsBoxPlaced, flow.all.fiberbox._WhereIsBoxPlaced.TITLE);
		var boxIsInOpendSpace = boxLocationStatus.exists && (boxLocationStatus.value == flow.all.fiberbox._WhereIsBoxPlaced.ONE_OPENED);
		if (Main.HISTORY.isClassInteractionInHistory(WhatIStheTVIssue, No))
		{
			/************************************
			 * TV    SOUND
			/************************************/
			if(boxIsInOpendSpace)
				this._nexts = [ {step: _StoreCustomersSetup}];
			else
				this._nexts = [ {step: _AdvicePutOpenSpace , params:[{step: _StoreCustomersSetup}]}];
		}
		else if (Main.HISTORY.isClassInteractionInHistory(WhatIStheTVIssue, Mid))
		{
			/************************************
			 * TV    FLOW
			/************************************/
			if(boxIsInOpendSpace)
				this._nexts = [ {step: IsAppleTVvisibleOnTVScreen}];
			else
		this._nexts = [{step: _AdvicePutOpenSpace, params:[{step: IsAppleTVvisibleOnTVScreen}]}];
		}
		else
		{
			if (Main.HISTORY.isClassInteractionInHistory(LanOrWiFi, No))
			{
				if(boxIsInOpendSpace)
				this._nexts = [ {step: _TestSpeed}];
			else
				this._nexts = [  {step: _AdvicePutOpenSpace, params:[{step: _TestSpeed}]}];
				
				//this._nexts = [ {step: _TestSpeed, params: []}];

			}
			else
			{
				if(boxIsInOpendSpace)
				this._nexts = [ {step: HaveRepeater}];
			else
				this._nexts = [  {step: _AdvicePutOpenSpace, params:[{step: HaveRepeater}]}];
				
				//this._nexts = [ {step:HaveRepeater}];
			}
		}
	}
	function getNextRXBAD()
	{
		var next = FiberCableChanged;
		if (Main.HISTORY.isClassInteractionInHistory(WhatIStheTVIssue, No))
		{
			/************************************
			 * TV    SOUND
			/************************************/
			this._nexts = [ {step: next, params: [
				{step:_StoreCustomersSetup},
				{step: SwapFiberCable},
				{step:_StoreCustomersSetup}
				]
			}];
		}
		else if (Main.HISTORY.isClassInteractionInHistory(WhatIStheTVIssue, Mid))
		{
			/************************************
			 * TV    FLOW
			/************************************/
			this._nexts = [ {step: next, params: [
				{step:IsAppleTVvisibleOnTVScreen},
				{step: SwapFiberCable},
				{step:IsAppleTVvisibleOnTVScreen}
				]
			}];
		}
		else
		{
			if (Main.HISTORY.isClassInteractionInHistory(LanOrWiFi, No))
			{
				this._nexts = [ {step: next,params: [
					{step:_TestSpeed},
					{step: SwapFiberCable},
					{step:_TestSpeed}
					]
				}];
			}
			else
			{
				this._nexts = [ {step:next, params: [
					{step:HaveRepeater},
					{step: SwapFiberCable},
					{step:HaveRepeater}
					]
				}];
			}
		}
	}

}
