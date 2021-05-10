package flow.tv.sound;

import tstool.process.ActionMultipleInput;

/**
 * ...
 * @author bb
 */
class _StoreCustomersSetup extends ActionMultipleInput 
{

	public function new ()
	{
		super(
		[{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:900,
				prefix:"Set up",
				debug: "Lots of equipment",
				position: [bottom, left]
			}
		}]
		);
	}
	//override public function create()
	//{
		//this._nextProcesses = [new _AppleTVSoundSetup()];
		//super.create();
	//}
	
	
	
	override public function onClick():Void
	{
		if (validate())
		{
			this._nexts = [{step: _AppleTVSoundSetup, params: []}];
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