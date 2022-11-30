package flow.nointernet.postLedChecks;

import flow.installation._EnsureNoLanLoop;
import flow.nointernet.so.tckets._SwapBox;
import flow.tickets.CustomerInstruction;
import flow.vti.ParseVTIHealthCheck;
import tstool.utils.VTIdataParser;
//import format.csv.Data.Record;
//import format.csv.Reader;
//import lime.utils.Assets;
//import tstool.layout.UIInputTfCore;
import tstool.process.DescisionMultipleInput;
import regex.ExpReg;

class IsSerialNumberCorrect extends DescisionMultipleInput
{
	//static inline var BOX_SERIAL:String = "^(SFAA|GFAB)?[0-9]{8}$";
	static inline var SERIAL_PREFIX:String = "Serial Nb";
	//var snsTab:Array<String>;
	var vals:Map<String,String>;
	var vtiSerial:String;
	var serial:String;
	//var snsTabRecord:Array<Record>;
	public function new()
	{
		super(
			[
		{
			ereg: new EReg(ExpReg.BOX_SERIAL,"gi"),
			input:{
				width:150,
				prefix:SERIAL_PREFIX,
				debug: "SFAA12345678",
				position:[bottom, left]
			}
		}]);
		var values = Main.HISTORY.findAllValuesOffOfFirstClassInHistory(ParseVTIHealthCheck);
		#if debug
		trace("flow.nointernet.postLedChecks.IsSerialNumberCorrect::IsSerialNumberCorrect::values", values );
		trace(values.get(VTIdataParser.routerSerialNumber));
		#end
		vtiSerial = values.get(VTIdataParser.routerSerialNumber);
		_titleTxt = StringTools.replace(_titleTxt, "<BOXSERIAL>", values.get(VTIdataParser.routerSerialNumber));
	}
	override public function onYesClick():Void
	{
		checkSN();
		if (validateNo() && isSameSerial())
		{
			this._nexts = [{step: _EnsureNoLanLoop, params: []}];
			super.onYesClick();
		}
		else{
			multipleInputs.inputs.get(SERIAL_PREFIX).blink(true);
		}
	}
	override public function onNoClick():Void
	{
		//this._nexts = [{step: _SwapBox, params: []}];
		checkSN();
		if (validateNo() && !isSameSerial())
		{
			this._nexts = [ {
				step: CustomerInstruction, params: [
				{step: _SwapBox},
				{step: _SwapBox}
				]
			}];
			super.onNoClick();
		}
		else{
			multipleInputs.inputs.get(SERIAL_PREFIX).blink(true);
		}

	}
	function checkSN()
	{
		serial = multipleInputs.inputs.get(SERIAL_PREFIX).getInputedText();
		vals = [for (k => v in multipleInputs.inputs) k => v.getInputedText()];
		var _index = Main.SN_TAB.lastIndexOf(serial) ;
		if (_index > -1)
		{
			vals.set("Chipset", Main.snTabRecord[_index][1]);
		}

	}
	override function pushToHistory( buttonTxt:String, interactionType:tstool.layout.History.Interactions,?values:Map<String,Dynamic>=null)
	{
		super.pushToHistory( buttonTxt, interactionType, vals);
	}
	inline function isSameSerial():Bool
	{
		return vtiSerial.toUpperCase() == serial.toUpperCase();
	}
}