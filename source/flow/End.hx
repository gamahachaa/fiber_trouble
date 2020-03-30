package flow;

import process.Action;

/**
 * ...
 * @author bbaudry
 */
class End extends Action 
{

	override public function create():Void
	{
		this._nextProcesses = [new Intro()];
		super.create();
	}
	
}