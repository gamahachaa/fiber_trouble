package flow.all.customer;

import flixel.addons.ui.StrNameLabel;
import tstool.process.ActionDropDown;

/**
 * ...
 * @author bb
 */
class WhithWhichDevice extends ActionDropDown 
{

	public function new() 
	{
		super([
			new StrNameLabel("", "Select ..."),
			new StrNameLabel("mobile", "Mobile/Tablet"),
			new StrNameLabel("computer", "Computer"),
			new StrNameLabel("game", "Game console"),
			new StrNameLabel("appleTV", "Apple TV"),
			new StrNameLabel("smartTV", "Smart TV"),
			new StrNameLabel("any", "Any device")
		]);
		
	}
	override public function create()
	{
		this._nextProcesses = [new LanOrWiFi()];
		super.create();
		
	}
	override public function onClick()
	{
		if (choice != "")
		{
			#if debug
				trace(choice);
			#end
			if (choice == "mobile") this._nextProcesses = [new IsSlowOrKaput()];
			super.onClick();
		}
		
	}
}