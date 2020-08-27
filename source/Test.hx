package;


import flixel.addons.ui.FlxUIDropDownMenu;
import flixel.addons.ui.FlxUIRadioGroup;
import flixel.addons.ui.FlxUIText;
import flixel.addons.ui.StrNameLabel;
import tstool.process.Action;


/**
 * ...
 * @author bb
 */
class Test extends Action
{
	//var customerProfile:Map<String, String>;
	//var i:layout.UIInputTfCore;
	//var j:layout.UIInputTfCore;
	override public function new()
	{
		
		super();
		//customerProfile = [];
	}
	override public function create()
	{
		
		
		var rd:FlxUIRadioGroup = new FlxUIRadioGroup(200, 200, ["a", "b", "c"], ["A", "B", "C"], function(e) trace(e),);
		add(rd);
	}
}