package flow.installation;
import flow.nointernet.customer.FiberCableChanged;
import flow.vti.ParseVTIHealthCheck;
import tstool.process.Process;
import tstool.process.TripletRadios;
import tstool.utils.VTIdataParser;


//import flixel.addons.ui.StrNameLabel;
//import tstool.process.ActionDropDown;
//import tstool.process.ActionRadios;
//import tstool.process.DescisionRadios;
//import tstool.process.ActionMultipleInput;

//class _EnsureCorrectPortPlug extends ActionDropDown
//class _EnsureCorrectPortPlug extends DescisionRadios
class _EnsureCorrectPortPlug extends TripletRadios
{
	var portID:String;
	public static inline var PORT_PLUGED:String = "PLUGED PORT";
	public function new() 
	{
		super([
			{
				title: PORT_PLUGED,
				values :["1","2","3","4"]
			}
		]);
		var values = Main.HISTORY.findAllValuesOffOfFirstClassInHistory(ParseVTIHealthCheck);
		portID = values.get(VTIdataParser.otoPortId);
		_detailTxt = StringTools.replace(_detailTxt, "<OTOPORT>", portID);
	}
	override public function onYesClick():Void
	{
		if (validate() && samePort())
		{
			this._nexts = [{step: getNExt(), params: []}];
			super.onYesClick();
		}
		else{
			this.radiosMap.get(PORT_PLUGED).blink(true);
		}
	}
	override public function onNoClick():Void
	{
		if (validate() && !samePort())
		{
			this._nexts = [{step: getNExt(), params: []}];
			super.onNoClick();
		}
		else{
			this.radiosMap.get(PORT_PLUGED).blink(true);
		}
	}
	override public function onMidClick():Void
	{
		//if (validate())
		//{
			 this._nexts = [{step: OTOPlugDamagedNotClicking, params: []}];
		//}
		super.onMidClick();
		
	}	
	inline function getNExt():Class<Process>
	{
		return Main.HISTORY.isClassInteractionInHistory(FiberCableChanged, No)? OTOPlugDamagedNotClicking : _CheckSFP;
	}
	inline function samePort():Bool
	{
		return  this.status.get( PORT_PLUGED ) == portID;
	}
	
}