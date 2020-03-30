package flow;

import js.Browser;
import process.Action;

class TutoTree extends Action
{
	override public function create():Void
	{

		this._nextProcesses = [new Intro()];
		//this._nextProcesses = [new WifiOnInDashboard()];
		super.create();
		this.details.text = "Hello " + Main.user.firstName + ",\n\n" + this._detailTxt;
		
	}

}