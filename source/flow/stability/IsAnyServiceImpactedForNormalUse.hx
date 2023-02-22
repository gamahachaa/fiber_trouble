package flow.stability;

import flow.all.customer.LanOrWiFi;
import flow.all.fiberbox._AdvicePutOpenSpace;
import flow.tickets.CustomerInstruction;
import tstool.process.Process;
//import tstool.process.Descision;
import tstool.process.DescisionMultipleInput;

/**
 * ...
 * @author bb
 */
class IsAnyServiceImpactedForNormalUse extends DescisionMultipleInput 
{
	
	public function new ()
	{
		super(
		[{
			ereg: new EReg("[a-zA-Z]+[\\s\\S]*","i"),
			input:{
				width:250,
				debug:"Debugging do not treat",
				prefix:"Service not usable",
				position: [bottom, left]
			}
		}]
		);
	}
	override public function onNoClick():Void
	{
		//this._nexts = [{step: _SendSpeedTemplate, params: []}];
		this._nexts = getNexts();
		super.onNoClick();
	}
	
	
	override public function onYesClick()
	{
		if (validateYes())
		{
			this._nexts = getNexts();
			super.onYesClick();
		}
	}
	
	/****************************
	* Needed for validation
	*****************************
	override public function onYesClick():Void
	{
		if (validateYes())
		{
			super.onYesClick();
		}
	}
	override public function validateYes():Bool
	{
		return true;
	}
	
	override public function onNoClick():Void
	{
		if (validateNo())
		{
			super.onNoClick();
		}
	}*/
	override public function validateNo():Bool
	{
		return true;
	}
	function isBoxInOpenedSpace():Bool
	{
		var boxLocationStatus = Main.HISTORY.findValueOfFirstClassInHistory(flow.all.fiberbox._WhereIsBoxPlaced, flow.all.fiberbox._WhereIsBoxPlaced.TITLE);
		return  boxLocationStatus.exists && (boxLocationStatus.value == flow.all.fiberbox._WhereIsBoxPlaced.ONE_OPENED);
	}
	
	function getNexts():Array<ProcessContructor> 
	{
		var isWiFiOnly = Main.HISTORY.isClassInteractionInHistory(LanOrWiFi, Yes);
		return if (isBoxInOpenedSpace() || !isWiFiOnly)
		{
			[{step: CustomerInstruction, params: [{step: _CreateSOTechModemSpeed}, {step: _CreateSOTechModemSpeed}]}];
		}
		else{
			[{step: _AdvicePutOpenSpace}];
		}
	}
	/**/
}