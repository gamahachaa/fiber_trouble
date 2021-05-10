package flow.collection;

import flixel.addons.ui.FlxInputText;
//import tstool.process.Action;
import tstool.process.ActionMultipleInput;

/**
 * ...
 * @author ...
 */
class _ExplainReasons extends ActionMultipleInput 
{

	//override public function create():Void
	//{
		//var reasonsInput = new FlxInputText(0,0,600,12);
		//super.create();
		//this._nextProcesses = [ new _SoTicketTreeTwoOne() ];
		//add(reasonsInput);
		//reasonsInput.x = this._padding;
		//reasonsInput.y = this.details.y + this.details.height + this._padding/2;
//
	//}
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
}