package flow.collection;

import flixel.addons.ui.FlxInputText;
import flow.tickets.CustomerInstruction;
//import tstool.process.Action;
import tstool.process.ActionMultipleInput;

/**
 * ...
 * @author ...
 */
class _ExplainReasons extends ActionMultipleInput 
{
	public function new ()
	{
		super(
		[{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:600,
				prefix:"Explain reasons",
				position: [bottom, left]
			}
		}]
		);
	}
	
	
	override public function onClick():Void
	{
		if (validate())
		{
			this._nexts = [{step: _SoTicketTreeTwoOne, params: []}];
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
	/*
	override public function onClick():Void
	{
		this._nexts = [{step: CustomerInstruction, params: [
		       	{step: _SoTicketTreeTwoOne},
				{step: _SoTicketTreeTwoOne}
		]}];
		super.onClick();
	}
	*/
}