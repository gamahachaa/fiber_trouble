package flow.tv.services;

import tstool.process.DescisionMultipleInput;

/**
 * ...
 * @author bb
 */
class DoesWantTVNow extends DescisionMultipleInput 
{

	public function new ()
	{
		super(
		[{
			ereg: new EReg("(fr|de|it)","i"),
			input:{
				width:30,
				prefix:"Lang package (fr, de or it)",
				position: [bottom, left]
			}
		}]
		);
	}
	override public function create()
	{
		this._nextYesProcesses = [];
		this._nextNoProcesses = [ new _CreateTicketTwoOneFive()];
		super.create();
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
	}
	override public function validateNo():Bool
	{
		return true;
	}
	*/
	
}