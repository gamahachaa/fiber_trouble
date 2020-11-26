package flow.tv.sound;

import flow.tv.app._QuitAndRelaunchSaltTV;
import tstool.process.DescisionMultipleInput;

/**
 * ...
 * @author bb
 */
class IsSameIssueWithOtherApps extends DescisionMultipleInput 
{

	public function new ()
	{
		super(
		[{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:250,
				prefix:"List other apps",
				debug: "Lots otf other apps",
				position: [bottom, left]
			}
		}]
		);
	}
	override public function create()
	{
		var next = new _QuitAndRelaunchSaltTV();
		this._nextYesProcesses = [ next ];
		this._nextNoProcesses = [ next ];
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