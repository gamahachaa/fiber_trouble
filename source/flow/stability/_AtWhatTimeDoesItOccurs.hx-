package flow.stability;

import flixel.addons.ui.FlxUIDropDownMenu;
import flixel.addons.ui.StrNameLabel;
import tstool.layout.History.Interactions;
import tstool.process.Action;
import tstool.process.ActionDropDown;

/**
 * ...
 * @author bb
 */
class _AtWhatTimeDoesItOccurs extends ActionDropDown
{
	public function new() 
	{
		super( [
			new StrNameLabel("", "Select ..."), 
			new StrNameLabel("< 8 h", "< 8 h"),
			new StrNameLabel("8h - 12h", "8h - 12h") ,
			new StrNameLabel("12 h - 14 h", "12 h - 14 h") ,
			new StrNameLabel("14 h - 18 h", "14 h - 18 h"),
			new StrNameLabel("8 h - 12 h", "18 h - 23 h"),
			new StrNameLabel("ANYTIME", "ANYTIME")
			]);
	}
	override public function create()
	{
		this._nextProcesses = [new _WhitWhatKindOfSite()];
		super.create();
		
	}
}