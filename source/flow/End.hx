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
		super.create();
		Main.track.setResolution();
		Main.track.send();
		ui.showHowto(true);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: Intro, params: []}];
		super.onClick();
	}
	
}