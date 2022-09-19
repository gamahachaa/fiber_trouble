package flow.stability;

import flow.tickets.CustomerInstruction;
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
		this._nexts = [{step: CustomerInstruction, params: [{step: _CreateSOTechModemSpeed}, {step: _CreateSOTechModemSpeed}]}];
		super.onNoClick();
	}
	
	
	override public function onYesClick()
	{
		if (validateYes())
		{
			this._nexts = [{step: CustomerInstruction, params: [{step: _CreateSOTechModemSpeed}, {step: _CreateSOTechModemSpeed}]}];
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
	/**/
}