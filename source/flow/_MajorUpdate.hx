package flow;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _MajorUpdate extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new Intro()];
		super.create();
	}
	
}