package flow;

import flow.Intro;
import js.Browser;
import tstool.process.Action;

class TutoTree extends Action
{
	override public function create():Void
	{
		super.create();
		this.details.text = "Hello " + Main.user.firstName + ",\n\n" + this._detailTxt;
	}
	override public function onClick():Void
	{
		this._nexts = [{step: Intro, params: []}];
		super.onClick();
	}
}