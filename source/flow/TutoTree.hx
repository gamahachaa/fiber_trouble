package flow;

import flow.Intro;
import js.Browser;
import tstool.process.Action;

class TutoTree extends Action
{
	override public function create():Void
	{

		this._nextProcesses = [new flow.Intro()];
		//this._nextProcesses = [new WifiOnInDashboard()];
		super.create();
		this.details.text = "Hello " + Main.user.firstName + ",\n\n" + this._detailTxt;
		
	}

}