package flow.installation;


//import flixel.addons.ui.StrNameLabel;
//import tstool.process.ActionDropDown;
//import tstool.process.ActionRadios;
import tstool.process.DescisionRadios;
//import tstool.process.ActionMultipleInput;

//class _EnsureCorrectPortPlug extends ActionDropDown
class _EnsureCorrectPortPlug extends DescisionRadios
{
	public static inline var PORT_PLUGED:String = "PLUGED PORT";
	public function new() 
	{
		super([
			{
				title: PORT_PLUGED,
				values :["1","2","3","4"]
			}
		]);
		
	}
	override public function onYesClick():Void
	{
		if (validate())
		{
			this._nexts = [{step: IsOtoPortWrong, params: []}];
			super.onYesClick();
		}
	}
	override public function onNoClick():Void
	{
		//if (validate())
		//{
			this._nexts = [{step: OTOPlugDamagedNotClicking, params: []}];
			super.onNoClick();
		//}
	}
	
}