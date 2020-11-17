package flow.stability;

import flow.nointernet.postLedChecks._ReadRXValues;
import tstool.process.Descision;
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
	override public function create()
	{
		this._nextNoProcesses = [new _AddMemoVti()];
		this._nextYesProcesses = [new _CreateSOTechModemSpeed()];
		super.create();
	}
	override public function onYesClick()
	{
		if (validateYes())
		{
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