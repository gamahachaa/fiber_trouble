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
}