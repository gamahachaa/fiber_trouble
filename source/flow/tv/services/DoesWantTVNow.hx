package flow.tv.services;

import flow._AddMemoVti;
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
				width:250,
				prefix:"TV basic package (fr, de, it)",
				debug: "fr",
				position: [bottom, left]
			}
		}]
		);
	}
	
	override public function onYesClick():Void
	{
		if (validateYes()){
			this._nexts = [{step: _CreateTicketTwoOneFive, params: []}];
			super.onYesClick();
		}	
	}
	override public function onNoClick():Void
	{
		if (validateNo()){
			this._nexts = [{step: _AddMemoVti, params: []}];
			super.onNoClick();
		}
	}
	/*
	override public function validateYes():Bool
	{
		return true;
	}
	*/
	/*
	override public function validateNo():Bool
	{
		return true;
	}
	*/
	override public function validateNo():Bool
	{
		return true;
	}
	/**/
	
}