package flow.tv.sound;

import tstool.process.ActionMultipleInput;

/**
 * ...
 * @author bb
 */
class _IssueDescription extends ActionMultipleInput 
{

	public function new ()
	{
		super(
		[
		{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:400,
				prefix:"Description",
				debug:"Description...",
				position: [bottom, left]
			}
		}]
		);
	}
	
	override public function onClick():Void
	{
		if (validate())
		{
			this._nexts = [{step: _HowFerquent, params: []}];
			super.onClick();
		}
	}
	
	/****************************
	* Needed only for validation
	*****************************/
	/*
	override public function validate():Bool
	{
		return true;
	}
	*/
}