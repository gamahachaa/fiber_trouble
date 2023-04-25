package flow.vti;
import flow.all.customer.LanOrWiFi;
//import flow.all.fiberbox._AdvicePutOpenSpace;
import flow.all.fiberbox._WhereIsBoxPlaced;
import flow.nointernet.customer.FiberCableChanged;
import flow.stability._TestSpeed;
import flow.swapcable.SwapFiberCable;
import flow.tv.WhatIStheTVIssue;
import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import flow.tv.sound._MakeSureHDMIWellConnected;
//import flow.tv.sound._StoreCustomersSetup;
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
	var boxIsInOpendSpace:Bool;
	public static inline var RX = "VTI RX";

	public function new()
	{
		super(
			[
		{
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
		//isBoxInOpenedSpace();
		//buildNexts();
		this._nexts = [ {step:  _WhereIsBoxPlaced}];
	}
	function getNextRXBAD()
	{
		var next = FiberCableChanged;
		if (Main.HISTORY.isClassInteractionInHistory(WhatIStheTVIssue, No))
		{
			// TV    SOUND
			this._nexts = [ {step: next, params: [
				{step:_MakeSureHDMIWellConnected},
				{step: SwapFiberCable},
				{step:_MakeSureHDMIWellConnected}
				]
			}];
		}
		else if (Main.HISTORY.isClassInteractionInHistory(WhatIStheTVIssue, Mid))
		{
			// TV    FLOW
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

	/*function buildNexts():Void
	{
		if (Main.HISTORY.isClassInteractionInHistory(WhatIStheTVIssue, No))
		{
			
			 // TV    SOUND
			
			if (boxIsInOpendSpace)
				this._nexts = [ {step: _MakeSureHDMIWellConnected}];
			
			else
				this._nexts = [ {step: _AdvicePutOpenSpace, params:[{step: _MakeSureHDMIWellConnected}]}];
			
		}
		else if (Main.HISTORY.isClassInteractionInHistory(WhatIStheTVIssue, Mid))
		{
			
			 // TV    FLOW
			
			if (boxIsInOpendSpace)
				this._nexts = [ {step: IsAppleTVvisibleOnTVScreen}];
			else
				this._nexts = [ {step: _AdvicePutOpenSpace, params:[{step: IsAppleTVvisibleOnTVScreen}]}];
		}
		else
		{
			if (Main.HISTORY.isClassInteractionInHistory(LanOrWiFi, No))
			{ // LAN
				if (boxIsInOpendSpace)
					this._nexts = [ {step: _TestSpeed}];
				else
					this._nexts = [  {step: _AdvicePutOpenSpace, params:[{step: _TestSpeed}]}];

				//this._nexts = [ {step: _TestSpeed, params: []}];

			}
			else
			{  // Wifi or Both
				if (boxIsInOpendSpace)
					this._nexts = [ {step: HaveRepeater}];
				else
					this._nexts = [  {step: _AdvicePutOpenSpace, params:[{step: HaveRepeater}]}];

				//this._nexts = [ {step:HaveRepeater}];
			}
		}
	}*/

	//function isBoxInOpenedSpace():Void
	//{
		//var boxLocationStatus = Main.HISTORY.findValueOfFirstClassInHistory(flow.all.fiberbox._WhereIsBoxPlaced, flow.all.fiberbox._WhereIsBoxPlaced.TITLE);
		//boxIsInOpendSpace = boxLocationStatus.exists && (boxLocationStatus.value == flow.all.fiberbox._WhereIsBoxPlaced.ONE_OPENED);
	//}

}
