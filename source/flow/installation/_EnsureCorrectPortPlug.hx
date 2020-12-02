package flow.installation;


import flixel.addons.ui.StrNameLabel;
import tstool.process.ActionDropDown;
import tstool.process.ActionRadios;
//import tstool.process.ActionMultipleInput;

//class _EnsureCorrectPortPlug extends ActionDropDown
class _EnsureCorrectPortPlug extends ActionRadios
{
	public function new() 
	{
		super([
			{
				title: "PLUGED PORT",
				values :["1","2","3","4"]
			}
		]);
		
	}
	override public function onClick():Void
	{
		if (validate())
		{
			this._nexts = [{step: IsOtoPortWrong, params: []}];
			super.onClick();
		}
	}
	
}