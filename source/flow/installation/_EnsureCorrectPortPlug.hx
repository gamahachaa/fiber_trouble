package flow.installation;


import flixel.addons.ui.StrNameLabel;
import tstool.process.ActionDropDown;
import tstool.process.ActionRadios;
//import tstool.process.ActionMultipleInput;

//class _EnsureCorrectPortPlug extends ActionDropDown
class _EnsureCorrectPortPlug extends ActionRadios
{
	//public function new() 
	//{
		//super([
			//new StrNameLabel("", "Select ..."),
			//new StrNameLabel("1", "1"),
			//new StrNameLabel("2", "2"),
			//new StrNameLabel("3", "3"),
			//new StrNameLabel("4", "4")
		//]);
		//
	//}
	public function new() 
	{
		super([
			{
				title: "PLUGED PORT",
				values :["1","2","3","4"]
			}
		]);
		
	}
    override public function create():Void
	{
		//this._nextProcesses = [new IsOTOidAligned()];
		this._nextProcesses = [new IsOtoPortWrong()];
		super.create();
	}
	override public function onClick():Void
	{
		
		if (validate())
		{
			super.onClick();
		}
	}
	
}