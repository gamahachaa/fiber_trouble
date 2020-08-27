package flow;

import flow.Intro;
import tstool.process.Action;

/**
 * ...
 * @author bbaudry
 */
class End extends Action 
{

	override public function create():Void
	{
		this._nextProcesses = [new flow.Intro()];
		super.create();
		Main.track.setResolution();
		Main.track.send();
	}
	
}