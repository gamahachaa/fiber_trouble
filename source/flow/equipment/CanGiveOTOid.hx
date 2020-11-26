package flow.equipment;

import tstool.process.DescisionMultipleInput;

/**
 * ...
 * @author bb
 */
class CanGiveOTOid extends DescisionMultipleInput 
{

	
	public function new ()
	{
		super(
		[{
			ereg: new EReg("^(A|B)\\.[0-9]{3}\\.[0-9]{3}\\.[0-9]{3}(\\.[0-9X])?$","i"),
			input:{
				width:300,
				prefix:"OTO ID",
				debug: "A.123.456.789.X",
				position: [bottom, left]
			}
		}]
		);
	}
	override public function create()
	{
		this._nextYesProcesses = [new HasAccessToMyAccount()];
		this._nextNoProcesses = [new _SoOrderProcessStatusCheck()];
		super.create();
	}
	/****************************
	* Needed for validation
	*****************************/
	override public function onYesClick():Void
	{
		if (validateYes())
		{
			super.onYesClick();
		}
	}
	/*
	override public function validateYes():Bool
	{
		return true;
	}*/
	/*
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